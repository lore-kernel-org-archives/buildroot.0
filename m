Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B304ACD4F3D
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 19:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86546418C3;
	Wed, 20 May 2026 19:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFRho_KSFqle; Wed, 20 May 2026 19:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3EDE418C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779306086;
	bh=wlJQkwF0k9wb0qX5HYqVmt9ZuqsfYi2AwlJkEP4XA2s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L4KZkCJu7tgOshQe9cL3iM8C1YdlUkSUrHq+LVd/kBLpmlhQc9izr7RfkMoqFPbmx
	 Yraswb8goW6EqWeMoqw4xKgdLkMjLZo0SsrW/t8zjtb5IMrI8hcBpiBmTyX8vNdamB
	 Mg4YAh6WRlsjCUehoMGIx8oVIC2eMGiYiLMv+fZwM9qIKVtjCy5rCx7b93PMM09ssq
	 dMBSAuCIGtEdHBKHOp2zb+mcPp0qVXFEK8kzmXg96TwGznSB5LUWYysuztHuJb0LA3
	 UXoBg8PKgVRsqUpUgpqyySffXcwsm/Rvp7kCLkzU95csfZ8wPPf36yzgyvItPeMrYT
	 PZGL63MA6XRtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3EDE418C5;
	Wed, 20 May 2026 19:41:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 44357265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35B16418C5
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPN7IkHsL93v for <buildroot@buildroot.org>;
 Wed, 20 May 2026 19:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83D08418C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83D08418C3
 for <buildroot@buildroot.org>; Wed, 20 May 2026 19:41:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CBFD8693B; Wed, 20 May 2026 19:41:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 May 2026 21:36:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e14863c9433f01bc02bb33933d86d8938b40cd7
X-Git-Newrev: 47b5cbb1cac5215a66590eb91937e29a7936d252
X-Patchwork-Hint: ignore
Message-Id: <20260520194117.3CBFD8693B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rsync: security bump version to
 3.4.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/47b5cbb1cac5215a66590eb91937e29a7936d252
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://download.samba.org/pub/rsync/NEWS#3.4.3

Fixes CVE-2026-29518, CVE-2026-43617, CVE-2026-43618, CVE-2026-43619,
CVE-2026-43620 & CVE-2026-45232.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 933d330323..666bb5cf99 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.2.tar.gz.asc
-sha256  ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315  rsync-3.4.2.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.3.tar.gz.asc
+sha256  c72e63ca3021cbc80ba86ec30102773f4c5631fbc492b52e773b3958f82a53d3  rsync-3.4.3.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 3282a759c6..5b4345d036 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.4.2
+RSYNC_VERSION = 3.4.3
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
