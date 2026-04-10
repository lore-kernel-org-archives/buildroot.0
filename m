Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F91F9D0D6
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4065342B02;
	Tue, 14 Apr 2026 15:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7dACcxxJgKs; Tue, 14 Apr 2026 15:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CFA442B26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181769;
	bh=5HTU+1rcx0PN+19023jJDZPP5Lk56kSDxj4pKWk1IEo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GkozQvB1AllL11zw7PA6/fSRgsW8ZK1V1ojQ3Q1srNOAn/RurLuCEawbgI4If+Eym
	 KrTHP2A+Yfg8U3BKpDXRWxAktpahYbAC1TflTjJYUslVY68X1QESWkh7BorHoIICeB
	 1dYEcyynYamKUFcBfpX3+1UmkB3zopHLdpgXXZQylYm5W/eomxB2Olosl3VhHMMzX7
	 YSDcBqfs/FNqTMgE0bCO8H21N4fgKFgbYq7UfuEdvRyQWc2tfqjrOFsEskaj5DlKbM
	 A7nohDu6GC461YhE6NdLuKS0slpXSA0apOlEQeDU6ALDRYjQx5MlTGwF49tbwnhTvu
	 CmT/LJPKgcA9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CFA442B26;
	Tue, 14 Apr 2026 15:49:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A24D1283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 948E942B2E
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C2N_HOUgNav7 for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEAAB42B06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEAAB42B06
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EFBD8150E; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 12:20:26 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 6f8f031cef37ac39a39241bd7871caf542f549be
X-Git-Newrev: 829b1819fcbd4b91c43c3971ca6ee859942639bc
X-Patchwork-Hint: ignore
Message-Id: <20260414154926.7EFBD8150E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] system: fix typo in
 comment
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/829b1819fcbd4b91c43c3971ca6ee859942639bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fix "TARTGET_DIR" -> "TARGET_DIR" typo.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 20080af519f9712687d2ccfe81c7e3c4929d800f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 system/system.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/system.mk b/system/system.mk
index 52e810868a..3da9d3b2dd 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -60,7 +60,7 @@ endef
 endif
 
 # This function rsyncs the skeleton directory in $(1) to the destination
-# in $(2), which should be either $(TARTGET_DIR) or $(STAGING_DIR)
+# in $(2), which should be either $(TARGET_DIR) or $(STAGING_DIR)
 define SYSTEM_RSYNC
 	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
 		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
