Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CC7C44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 19:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D35160724;
	Wed, 15 Jul 2026 19:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ApQR9HQhvv7; Wed, 15 Jul 2026 19:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E4236069A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784143241;
	bh=ZQrW0QE5qgwEwlLpR0Nb7KEiE2CExEHsIQMzf4l+3eU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sWuWkk+/nquoIv40brBxgtDbZCily6F4AFWX58aK3OmD1NL0HRiZcwLKTUk1kikwb
	 bmIerf2D8wX8YYZZOJmHtlscahsICYCKR57W32OtAGNbZiA/4OBuEiQcbGdE6+Sv0z
	 aXdUwyR/YFK8F6pUElSbL/jTJGclDuMB98y5+hNWB6/AAX5fcFjqz99A6vy9wLLuz6
	 rv2TqoP44zMXq+eQR51iMoWyq/GVUsry4dzKbOXtejFpagORYjeYeQMvqey4n0izrq
	 Dho+CByuVPtZoZK+lAOKgiq6FO1qBzusbz6ZWpfHU8qoVCyEmGc5rno0nu8Tk2F2q/
	 qb+pFeKbMAbjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E4236069A;
	Wed, 15 Jul 2026 19:20:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D98D2203
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAEAC4071C
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hizR_7oNWjJ for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 19:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE3F740714
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE3F740714
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:20:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93C1688983; Wed, 15 Jul 2026 19:20:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Jul 2026 21:19:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 27265025e7f2fb7c4d384d4ef3d7531e5a038862
X-Git-Newrev: 135af563b945b8c3d18f8fd370370075b9edb140
X-Patchwork-Hint: ignore
Message-Id: <20260715192003.93C1688983@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: Update for
 2025.02.16
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/135af563b945b8c3d18f8fd370370075b9edb140
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 94588583f2..2837dfc437 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02.15
+export BR2_VERSION := 2025.02.16
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1781644300
+BR2_VERSION_EPOCH = 1784143200
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
