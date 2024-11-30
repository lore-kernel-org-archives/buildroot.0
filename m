Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23391D7360E
	for <buildroot@archiver.kernel.org>; Sat, 30 Nov 2024 22:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3E468495D;
	Sat, 30 Nov 2024 22:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B5dPhqNXduL1; Sat, 30 Nov 2024 22:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7D9A8495F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7D9A8495F;
	Sat, 30 Nov 2024 22:38:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5D1D71F
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 22:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5DCB404BF
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 22:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTa3_lE0Nrhd for <buildroot@buildroot.org>;
 Sat, 30 Nov 2024 22:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4D4540158
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4D4540158
 for <buildroot@buildroot.org>; Sat, 30 Nov 2024 22:38:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA9678674A; Sat, 30 Nov 2024 22:38:27 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Nov 2024 23:34:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c47e0483a5835aa609d099f07a7d874d13c6fd33
X-Git-Newrev: 65814351b9d2f3202f7f87e2eb163cc0eb9a34d0
X-Patchwork-Hint: ignore
Message-Id: <20241130223827.AA9678674A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bubblewrap: bump to
 version 0.11.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=65814351b9d2f3202f7f87e2eb163cc0eb9a34d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version adds support for creating overlay mounts (which requires
running with user namespaces available), and fixesd to I/O operations
on sockets. Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.11.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bubblewrap/bubblewrap.hash | 6 +++---
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index 37276046b8..b2b88ffe92 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,6 +1,6 @@
-# Locally generated after checking GPG signature from
-# https://github.com/containers/bubblewrap/releases/tag/v0.10.0
-sha256  65d92cf44a63a51e1b7771f70c05013dce5bd6b0b2841c4b4be54b0c45565471  bubblewrap-0.10.0.tar.xz
+# Also checked GPG signature from
+# https://github.com/containers/bubblewrap/releases/tag/v0.11.0
+sha256  988fd6b232dafa04b8b8198723efeaccdb3c6aa9c1c7936219d5791a8b7a8646  bubblewrap-0.11.0.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 94ae72d4d2..ea46d7a127 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.10.0
+BUBBLEWRAP_VERSION = 0.11.0
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
