Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B71C5DF8C
	for <buildroot@archiver.kernel.org>; Sun, 23 Aug 2026 20:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E992980AF9;
	Sun, 23 Aug 2026 20:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6CHCXZn5IFp; Sun, 23 Aug 2026 20:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787518714;
	bh=QAXYf4pMzS1gcJQnWuiBTB/Ft0p74JGnhRc4BzGd0HE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KaYnQldgahKpgWMXrDLysXuaEYn8sapate1z4/JiIQC2MrYzLwfsWJXAkfIy4wnNp
	 WwNekINOPf7W+a32E2XnvUAdGn1Xrc9ylVNyZtlxgJbKBG4+YKh/Iio5UZFlrKWayL
	 D2ulzJy7lYLkoFrdQLi1B2OGGJ52HN+t7NazAJJ9GGU2/p0ltwMHm2sEQVZbvClJMn
	 /DtW97sZZyhavVm2uM75bVzDSrUXRUKKahqfyvo+JEQPKPMTQrjz8yuddGqVLwzQHw
	 80D1ieESPkQlVycWyTp2h7ctw/1L4gV34DLyX8e+p4vxWMpxPQdP4Ixv9fhuGMGzh2
	 bavRFNvHQ5QGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D0A080AFB;
	Sun, 23 Aug 2026 20:58:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 408B642B
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32A1560608
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n9exmZWgqkVc for <buildroot@buildroot.org>;
 Sun, 23 Aug 2026 20:58:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A75FA60600
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 20:58:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA88D8EBFE; Sun, 23 Aug 2026 20:57:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Aug 2026 22:57:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f8089744f95a27f45a9668a0c1f5b35c9f7ccafc
X-Git-Newrev: d0820dd09916edcefc44e525355afbea30d5bee4
X-Patchwork-Hint: ignore
Message-Id: <20260823205737.EA88D8EBFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: Update for
 2025.02.17
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d0820dd09916edcefc44e525355afbea30d5bee4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 2837dfc437..3b03b619d4 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02.16
+export BR2_VERSION := 2025.02.17
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1784143200
+BR2_VERSION_EPOCH = 1787518700
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
