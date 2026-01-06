Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2C4D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7684D409FF;
	Wed,  7 Jan 2026 17:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3VkANkdlEan; Wed,  7 Jan 2026 17:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9926040C78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808122;
	bh=0L8CRBQGaaAEGdU8seVUbaViIfvVvzoeIA89jYoM5Ks=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rg0doIa2KuipwwCzqRXKvowII49pZyJdU1keTKKr3Xm7ted4C/QDiQ2xum8YWM3Yh
	 8yR67oPAh6e/zwTF3IXvmcbNUDDOgJU60awUeMtP9fPc8Rpn/b4Wdd6PCPE4fExtw6
	 rM1JgBU0apnArkg9z8I/0QnARS/SKxjHSlbTxRy28GIZK5VB+QiX09dLTIHLBYNLxU
	 APJ8a8DnhHm9+GOD+klFt+YLf7K3jWyqBI2Dq11kzufmxjMJRvkBbczk9sPhugbAmB
	 ELJeqscT0A6tt5w6wDj6AJhpcJjRJX0/gYUaee9pl9Y9Q7meG+f90XwXSplvJYhxsN
	 6cqezIGLbTsEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9926040C78;
	Wed,  7 Jan 2026 17:48:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E1B125B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2320980ABB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aS8O5gBLAkq9 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BAC480A96
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BAC480A96
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AB2D883AA; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:55 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 46caf186203e15d1369123504bcab6e6e567aac0
X-Git-Newrev: 17d34db2e691f604fde971c17e3585015734c40d
X-Patchwork-Hint: ignore
Message-Id: <20260107174642.1AB2D883AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/matchbox-panel:
 fix build with GCC 14.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=17d34db2e691f604fde971c17e3585015734c40d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

No autobuild errors recorded due to download errors with dependencies.

Patch not sent anymore, original project has no updates since 2010:
https://git.yoctoproject.org/matchbox-panel

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e235a191dd8bd6d5bdb9434352deae86953cfa49)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/matchbox-panel/0004-fix-build.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/matchbox-panel/0004-fix-build.patch b/package/matchbox-panel/0004-fix-build.patch
new file mode 100644
index 0000000000..bed7e84b1f
--- /dev/null
+++ b/package/matchbox-panel/0004-fix-build.patch
@@ -0,0 +1,16 @@
+Description: fix FTBFS with stricter GCC flags
+
+Upstream: https://sources.debian.org/src/matchbox-panel/0.9.3%2Bgit20100816-2/debian/patches/fix-build
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Index: matchbox-panel-0.9.3+git20100816/src/msg.h
+===================================================================
+--- matchbox-panel-0.9.3+git20100816.orig/src/msg.h	2020-06-16 16:04:57.000000000 +0100
++++ matchbox-panel-0.9.3+git20100816/src/msg.h	2024-08-09 11:22:54.986036009 +0100
+@@ -17,5 +17,6 @@
+ void msg_handle_events(MBPanel *d, XEvent *e);
+ void msg_handle_timeouts(MBPanel *d);
+ void msg_cancel(MBPanel *d, XClientMessageEvent *e);
++Bool msg_set_timeout (MBPanel *d, struct timeval *tv, struct timeval **tvp);
+ 
+ #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
