Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFA0C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A2F181131;
	Fri, 31 Jul 2026 11:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsG83rWWYZY2; Fri, 31 Jul 2026 11:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 222958112D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499021;
	bh=cxhq5fJ3oILfDyqGn6QADuWAZzYRh76wYJ2ga3CMQ3E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KxfaeqItMnj84WPEO2BRQL+ZkRuruKXmJ9L0qubxbFIKVWwTPzfdaCFeeQTqWkfWo
	 SIIZ8Si/G5BHWuYMCpC9dVVJkL1FnY/WoHZoMKr5WSEZt3o3ebAY5QeFM9p3U3749j
	 dvD8nDBWt3ZpMpgkiOZ1xGfj6LAOxwxz+qepDR8z7S8qVMx9W2jOr023B+oCiw5tt0
	 fDG50Z78WyQc/Z8xowAG6FQ7Bh4L2VfkzyE+M8p9goq+nO8qv/eslfqf+6kVlxLuDk
	 rb9KNG8iJ+Mkt5Y3DQW/tFstxjBr/1W8dhBaCOYRK+KGEiNLO8wTrQGcOMdFC2hZXy
	 QddKyuFDwkvWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 222958112D;
	Fri, 31 Jul 2026 11:57:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FD1B23F
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3649480F91
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zeYIRWI0YIq for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1506810AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1506810AC
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D33308B742; Fri, 31 Jul 2026 11:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:19:19 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d3c2724f06638a4254a5c0c47bd2859de5e9ab81
X-Git-Newrev: 8ae5fbe1732bc311dcf03b03b36cf55564f65b35
X-Patchwork-Hint: ignore
Message-Id: <20260731115605.D33308B742@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/urandom-scripts:
 add license info
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8ae5fbe1732bc311dcf03b03b36cf55564f65b35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The package is part of Buildroot and thus under GPL-2.0-or-later
unless stated otherwise, as described in COPYING.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0f80126bfe8549b2e41a50a884af55fe9872be1f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/urandom-scripts/urandom-scripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/urandom-scripts/urandom-scripts.mk b/package/urandom-scripts/urandom-scripts.mk
index 89abdfff72..cc5f28d13a 100644
--- a/package/urandom-scripts/urandom-scripts.mk
+++ b/package/urandom-scripts/urandom-scripts.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+URANDOM_SCRIPTS_LICENSE = GPL-2.0-or-later
+
 define URANDOM_SCRIPTS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 $(URANDOM_SCRIPTS_PKGDIR)/S01seedrng \
 		$(TARGET_DIR)/etc/init.d/S01seedrng
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
