Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D22FCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 628304216E;
	Fri, 29 May 2026 08:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADRz42RBdwSD; Fri, 29 May 2026 08:28:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8992A4215D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043309;
	bh=HLhYsqev30DGNhVuDd3DmeE7Eh1VvLq+3x0DE7tU8M8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HNKTcQmLVyKWy/MvO6DXI1miinb1R9laEwQfqJ8k++UEG2Asz1x5v6RsWKGl+Rgrf
	 XfYepp39cuZ7ajsfIJI4p4qg2iP5uVl2iSYq+kSdoNfNKqvanhXD98/jfY9v4HfNwD
	 TpNkKpBhRz6jvCgpZ6iqaMxoCWKxHZ/lB596OIua3ck5jX74IxeZ9avm0JBbRxL80Z
	 eUweCOPI/gWQkao8ACG06COX2L8pFltwBITuWKsayOiF1Zkw+oM8IqL1HL4GcAgScK
	 +uTYzW6x9k8/tl8f/xmqV+KcgnJtAiEA1FtOzybWlzMfmOzY7mzezifdUZ8x6hQ/UR
	 J4rOCMzyoYNcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8992A4215D;
	Fri, 29 May 2026 08:28:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1044F28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2130861339
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQbwIflrTPn5 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90E5D6132E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90E5D6132E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EB7087355; Fri, 29 May 2026 08:27:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:44 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: d6ea7821f2146897b33a19ccd388949d273e532b
X-Git-Newrev: ca9d847951ebac413ffa0441daaf7451e9d28b53
X-Patchwork-Hint: ignore
Message-Id: <20260529082749.2EB7087355@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libde265:
 security bump version to 1.0.19
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ca9d847951ebac413ffa0441daaf7451e9d28b53
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/strukturag/libde265/releases/tag/v1.0.19

Fixes CVE-2026-45382 & CVE-2026-45383.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 0d3d25bcc95c4d18f6c123eb4e90b9ac93264504)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libde265/libde265.hash | 4 ++--
 package/libde265/libde265.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index d977af5521..0412936d42 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libde265/releases/tag/v1.0.18
-sha256  800478f3bf35f0621b14928ceb317579f3e8b23de4bd2aac29b6cb8be962bbd8  libde265-1.0.18.tar.gz
+# From https://github.com/strukturag/libde265/releases/tag/v1.0.19
+sha256  bb19a0b485d2643e0eeb7e91f3ab32d1ad617e7c487dbedc91214ca3dbd8d7eb  libde265-1.0.19.tar.gz
 # Locally computed
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index aab86ab3d7..8c2fa4a3c3 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.0.18
+LIBDE265_VERSION = 1.0.19
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
