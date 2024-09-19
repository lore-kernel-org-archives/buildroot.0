Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727E5CF3962
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 19:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 391664173F;
	Thu, 19 Sep 2024 19:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lsOHSEUtdMlO; Thu, 19 Sep 2024 19:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22E6241750
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22E6241750;
	Thu, 19 Sep 2024 19:59:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F41E1BF292
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BFC561B3A
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbmuY9A7yjmk for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC0FC61B3D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC0FC61B3D
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C91D983CF4; Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:56:20 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 53b34b2e113ae2c8ff9f09e2ced0fb430d86d65a
X-Git-Newrev: e7f207edc7ee2696793a8831360d267ef7e5a3f1
X-Patchwork-Hint: ignore
Message-Id: <20240919195837.C91D983CF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libfreeglut: fix
 typo in help text
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7f207edc7ee2696793a8831360d267ef7e5a3f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce7a0875cd0ae59b59e0818112b5afd3f2cf37ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfreeglut/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfreeglut/Config.in b/package/libfreeglut/Config.in
index ccb2d5cddc..a3e20fd509 100644
--- a/package/libfreeglut/Config.in
+++ b/package/libfreeglut/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LIBFREEGLUT
 	  OpenGL Utility Toolkit (GLUT) library. GLUT (and hence
 	  FreeGLUT) takes care of all the system-specific chores
 	  required for creating windows, initializing OpenGL contexts,
-	  and handling input events, to allow for trully portable OpenGL
+	  and handling input events, to allow for truly portable OpenGL
 	  programs.
 
 	  http://freeglut.sourceforge.net
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
