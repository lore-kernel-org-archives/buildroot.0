Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3BCF5A8A6
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B9CF82BA1;
	Mon, 20 Apr 2026 17:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Mov5pnr_xNF; Mon, 20 Apr 2026 17:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CD1582CAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776705868;
	bh=Qb1yvK4pw6sIfLIv3X12Qb+G66IDHtwiWJWzy5Y7KRg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IKQxpIU0Y3hV78LgZXZ9e2+kl3HFsfDf5o1mPHkOd4Ea6qIaTfjFuCjseQFxZIFEZ
	 4WtfilWHlVcOY6uhDOqumyFh7SFxvI+AIcIQ7xkf/7dt9NrwxBR/mKmeZnw5djylbS
	 vOlr2YmciMOI+Ue9fYEMJ3qYQlUaCSdo0QpXKiA0cLgOCl6IKtd1u2pkgd8CogAGgh
	 z58tQCN2N/eZ3XfJtPjj8xAZMDoxuMz/w6f6jQ8k9T6FKxW+eQRyrXAaEROmcOPJzM
	 SX/nIO5Pv/bYRlekVaWGw4+3MeEaQi34FBWjhvo91Co4B8OEux6NU4u8Swu7I0YmmK
	 ScbuEdBW5O8Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CD1582CAC;
	Mon, 20 Apr 2026 17:24:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87AE7257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DCCE610EB
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wal5jn-UpDra for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D2186103C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D2186103C
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46AB4820E1; Mon, 20 Apr 2026 17:24:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 19:23:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 892aed53e0916cf19d752ec496a02978cc12eac2
X-Git-Newrev: 2ca0fdb48d09858e2fb3704473519aa07f6d876d
X-Patchwork-Hint: ignore
Message-Id: <20260420172425.46AB4820E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cage: bump version to 0.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2ca0fdb48d09858e2fb3704473519aa07f6d876d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version adds support for the wlr-foreign-toplevel-management and
drm-lease-v1 protocols; switches the wlroots dependency to 0.20.0; and
includes a few fixes. Release notes:

  https://github.com/cage-kiosk/cage/releases/tag/v0.3.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cage/cage.hash | 4 ++--
 package/cage/cage.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/cage/cage.hash b/package/cage/cage.hash
index 018404a2c5..4b05602822 100644
--- a/package/cage/cage.hash
+++ b/package/cage/cage.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  9603ba1a130696dd39793ffab68397db504b378a733c09c0b86a5ebe3d6fe58d  cage-v0.2.1-git4.tar.gz
+# Locally computed, after checking PGP signature
+sha256  cd2510f83bef3e08e660d99492ca7761b218ecb53ee01cdbbeee3d6aabc7734e  cage-0.3.0.tar.gz
 
 # Hashes for license files:
 sha256  e117104073335dbaf78596fb1bedf89dda63c71f60f0b665947b2d369c77ecee  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
index 9b5778449b..4495c59b4f 100644
--- a/package/cage/cage.mk
+++ b/package/cage/cage.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-CAGE_VERSION = v0.2.1
-CAGE_SITE = https://github.com/cage-kiosk/cage.git
-CAGE_SITE_METHOD = git
+CAGE_VERSION = 0.3.0
+CAGE_SITE = https://github.com/cage-kiosk/cage/releases/download/v$(CAGE_VERSION)
 CAGE_LICENSE = MIT
 CAGE_LICENSE_FILES = LICENSE
 CAGE_DEPENDENCIES = host-pkgconf wlroots
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
