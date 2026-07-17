Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD36C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C164180BBD;
	Fri, 17 Jul 2026 15:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80-LTfoO9_AJ; Fri, 17 Jul 2026 15:44:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3EC580CD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303064;
	bh=IVCNwrCKnJ/WluXnxih1Gb5GOYXBzDIbPFV3RbRRrtY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=myKjMIX5fSj6lKD7LIP+OybrEqc8cCT1ghy+v6F6c2bU3oqXOBx0FbpSJGXUqGtSL
	 s7C6qMuq6JXmr0JZH0E5E0ispZCuwPqlxdjr1SzVmfm8ofIHc6HcQDHb1J3u428hLr
	 pD8sUe6uOU6Yr2Hl6RHZhV4i5GzRP4tnCZ26z2rm7LMf9G8zBbm7Ot9aKRXkV4wief
	 djXGxDRY9cmw/H1DxtweJwWYoxA397J3HW8hxh5DtaaE09Zx9aCCO5Q8Sug3Pqe1tD
	 /B2h4siGpUar40wUudUCHyd/b1ER2pcoFAfNTdKbywOBlA7X2xyZJdlj3QyEazWSpP
	 cM7wADZoRAjMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3EC580CD8;
	Fri, 17 Jul 2026 15:44:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 85AD61F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BEF760ACA
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_eeq0ad8jCu for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D66D560732
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D66D560732
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:44:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 954CB88E55; Fri, 17 Jul 2026 15:43:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Jul 2026 11:01:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 17e452aee00023236b8707869d001ac6102c6521
X-Git-Newrev: 6a54f8f044ee48bde782986558c505a15d41f7fc
X-Patchwork-Hint: ignore
Message-Id: <20260717154343.954CB88E55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcamera: update
 source URL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6a54f8f044ee48bde782986558c505a15d41f7fc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

libcamera has moved for a while now to gitlab.freedesktop.org. The
mirror on git.linuxtv.org is still active, but it isn't the canonical
repository and has less bandwidth than freedesktop.org. Switch the
libcamera source URL to gitlab.freedesktop.org.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
[Julien: removed trailing slash in _SITE]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 138713f39a999c30adec7f2e2829aa67af87a110)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcamera/libcamera.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 2712687913..265d2abae6 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
+LIBCAMERA_SITE = https://gitlab.freedesktop.org/camera/libcamera.git
 LIBCAMERA_VERSION = v0.4.0
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
