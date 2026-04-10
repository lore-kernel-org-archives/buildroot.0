Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D2FF9D0DB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97ED542AF1;
	Tue, 14 Apr 2026 15:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pt-C95RPavUc; Tue, 14 Apr 2026 15:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2024342B0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181365;
	bh=3KdPWrmWs2xOXzFfse8Da791D3VPNR8YHsU0IWrCKJg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qx1tYeFCjv8jdNtrVazR1UAEnkHIbgP+HUfIdpG1K2njtMCJkgc0xHkJFOrh2OR5T
	 hrdTRtUIfNigS+lOwwdmPGCq2gbKM2oDmM7+a981TRXVeOGyBTy4qS5HuI5ujtBj83
	 HHsNHTQoqmy9UJ8yXg9TDsAAY963MaLynMJ7R+iWfBmBmxte20atPqO+qBs5ewTHXI
	 +cULnyjeDpQ5+1KkqIrpIdwV00mljewpqw7FnX6X9zVuq0vrtX5QeK2thgqHW9oLbC
	 LSN2yhskS4OD5tvWQGKJaRHgBDbPhav0R0X6CwvMJ7WYy+JJQa537grCdudTxXODPJ
	 fuZMnpgkPKY5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2024342B0F;
	Tue, 14 Apr 2026 15:42:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AF97283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 217816EE12
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQ0drnJ4Wr2w for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B60A06F47F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B60A06F47F
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C4DA814A9; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 13:59:14 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e3d10db814da1eafe3ec1c2e340bd23ce6f62ee8
X-Git-Newrev: 886ed61c7d3ea5036f5c09a222f59ace587e4091
X-Patchwork-Hint: ignore
Message-Id: <20260414154237.4C4DA814A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/giflib: update
 tarball URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/886ed61c7d3ea5036f5c09a222f59ace587e4091
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Upstream moved all tarballs to new locations:
https://sourceforge.net/p/giflib/bugs/190/

Fixes:
https://autobuild.buildroot.net/results/c7f/c7f918fe7c879706c5a5875ea11c5f8b57007a85/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ea698142bdd04811fd85f5c6e492d4f896b32990)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/giflib/giflib.hash | 2 +-
 package/giflib/giflib.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index f11d4f1505..dcc384a523 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,4 +1,4 @@
-# From http://sourceforge.net/projects/giflib/files
+# From https://sourceforge.net/projects/giflib/files/giflib-5.x/
 md5  913dd251492134e235ee3c9a91987a4d  giflib-5.2.2.tar.gz
 sha1  608ba98d2dd8d03dfa7476f434d57de50a33e10b  giflib-5.2.2.tar.gz
 # Locally computed
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index f37ec8af21..00922ce2db 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-GIFLIB_VERSION = 5.2.2
-GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
+GIFLIB_VERSION_MAJOR = 5
+GIFLIB_VERSION = $(GIFLIB_VERSION_MAJOR).2.2
+GIFLIB_SITE = https://sourceforge.net/projects/giflib/files/giflib-$(GIFLIB_VERSION_MAJOR).x
 GIFLIB_INSTALL_STAGING = YES
 GIFLIB_LICENSE = MIT
 GIFLIB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
