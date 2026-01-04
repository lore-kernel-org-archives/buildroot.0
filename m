Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761D6C2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 14:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D455607ED;
	Sun,  4 Jan 2026 14:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sF-vlC4ZCdq9; Sun,  4 Jan 2026 14:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B805860756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767537685;
	bh=zl5xJE426Waa5FTGPNy952If9sEBfWQPEbTeLQy2BZo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WpT0Foa0fleJKb3JHSIBem4t9uWXwuTt4JON7Gs4kxzZIedOyVavg7WYQA3aNYmvh
	 tJl/Qv0hqcX2ccuxGwy0QDXK5B0AWyQ6p5FtXJPqOkrqPDrfGt2iejHQ20p/yCjmYT
	 lZLl8MtlUkG+/AwJ9/ribQGn786o3vqjJnkx8aLIBSG22OQLRBBiUeUkjpZ2hzK7Da
	 LAtXI6reWuSDlJ24P+/+ZqnMMvjIDrhQTnFzUz47aEAk3phNwK/8kqs0zQzOqDf5Hc
	 qKR11IXFke5dPNtErbzz4Gbx/wV2+KNbwviyXxcfcQbTEjPJbmaXXncdp5A/EERvot
	 yqVp7K95qNX+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B805860756;
	Sun,  4 Jan 2026 14:41:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F93E229
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3655140387
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWDKLmahP0WS for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 14:41:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F8D740377
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F8D740377
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:41:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 770128810E; Sun,  4 Jan 2026 14:41:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 15:32:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8cc383185c103bdb7d2bb9bafe68f858283290b1
X-Git-Newrev: 41de83af1fba998ab9b1e5e92b5efda910dcfd37
X-Patchwork-Hint: ignore
Message-Id: <20260104144123.770128810E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtracefs: bump to version 1.8.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=41de83af1fba998ab9b1e5e92b5efda910dcfd37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=libtracefs-1.8.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libtracefs/libtracefs.hash | 2 +-
 package/libtracefs/libtracefs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
index 17036c3f00..d4f6b95094 100644
--- a/package/libtracefs/libtracefs.hash
+++ b/package/libtracefs/libtracefs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  255980e1da5648fbbc32777ed8457b485b2b96f3449674610b46d9c437271209  libtracefs-1.8.2.tar.gz
+sha256  a9cd9cbae81b7fff71b3f72d2b819e49cec0402529e5f252e1d9319a62a356cb  libtracefs-1.8.3.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
index 6b8f838c2e..e9e577d985 100644
--- a/package/libtracefs/libtracefs.mk
+++ b/package/libtracefs/libtracefs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEFS_VERSION = 1.8.2
+LIBTRACEFS_VERSION = 1.8.3
 LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
 LIBTRACEFS_INSTALL_STAGING = YES
 LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
