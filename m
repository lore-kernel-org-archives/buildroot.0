Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37498D0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AB9E40981;
	Wed,  7 Jan 2026 18:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05QSpZMmNrDe; Wed,  7 Jan 2026 18:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21BAE41062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808892;
	bh=sqSzhwADDDoGXPf9Iz8jxxPZGPWpQMJrE0btJs2ZQqI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ObQ8C+N/t6o69Gze7WM7FY7WkNDw6y4B71VSFSAYHI5TQfTaszGOY1d8FFLbBRQ6Q
	 VYIgAJEjiIdpXJ6H/Yb5Sc7d5wyR1k1r75F+/P9sPYwYWHP5veuJkK+R+t+aWG+Rcq
	 FDrOdCejazGAu7VqJJPZu9sMAznbYS6L9JvrXrXVFCsX8V8MMwSrXGBwu0O1FRxs7r
	 lBjBmr+w/Wrf/1oAcsNJ1VoLKGQ3eEWAUJ8koCRFjxrMB1GYICH2Fab7D5sFvQ2FN4
	 lWuWFLQhUeoP2+0hOp0GXcXUhayKsUltpc6vQC97gSLVw0c1FdSWzwoulOrdlI0npr
	 PEDsUbvuUjNAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21BAE41062;
	Wed,  7 Jan 2026 18:01:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 04C4A9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A93D40A38
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1b26DPIGsQ_T for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B50D40A06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B50D40A06
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5882F87C86; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:22:25 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 7be6c54266ee159203555c956d270ba39ec863c4
X-Git-Newrev: ca0f992fe9d74fa570fb23ffbeb7a9438e5683df
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.5882F87C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/v4l2loopback:
 bump version to 0.15.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca0f992fe9d74fa570fb23ffbeb7a9438e5683df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Changelog:
https://github.com/v4l2loopback/v4l2loopback/blob/v0.15.3/ChangeLog

This new version fixes compilation errors with gcc >= 14.

Fixes:
https://autobuild.buildroot.net/results/910/910e27b189c62f977bc42f7c53471334eb765168/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add comment about the fixed issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5ab46339aa1efb7c226fe01113d19c4682435f5c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/v4l2loopback/v4l2loopback.hash | 2 +-
 package/v4l2loopback/v4l2loopback.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/v4l2loopback/v4l2loopback.hash b/package/v4l2loopback/v4l2loopback.hash
index c7fb226add..12ca4ec6cd 100644
--- a/package/v4l2loopback/v4l2loopback.hash
+++ b/package/v4l2loopback/v4l2loopback.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e57e1e382d7451aa2a88d63cc9f146eab1f425b90e76104d4c3d73127e34771  v4l2loopback-0.13.2.tar.gz
+sha256  2758ea287da8dd34a0421c0dd50094a0342d22414e1bbccbbe92f41bbaa26b2d  v4l2loopback-0.15.3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index a4ddf5e2d9..5c3562160f 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-V4L2LOOPBACK_VERSION = 0.13.2
+V4L2LOOPBACK_VERSION = 0.15.3
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
