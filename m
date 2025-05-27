Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05EFC5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CF0E83C61;
	Wed,  4 Jun 2025 18:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfGE8LpQCVvL; Wed,  4 Jun 2025 18:28:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCAC383C35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCAC383C35;
	Wed,  4 Jun 2025 18:28:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 354B6DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CEF640050
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LU5RmL7rnbYm for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 239D1400A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 239D1400A1
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21DC4876DC; Wed,  4 Jun 2025 18:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:27:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1ee5a6c4006f9ba1eef1e2f5d11c697d352ca60d
X-Git-Newrev: 956024af8e81be69dd0495304e0e1901e365bddb
X-Patchwork-Hint: ignore
Message-Id: <20250604182758.21DC4876DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sox: rework the
 0001 patch to make it Git-applicable
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

commit: https://git.buildroot.net/buildroot/commit/?id=956024af8e81be69dd0495304e0e1901e365bddb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Due to the "From:" in the commit log itself, this patch was not
applicable using git am:

$ git am 0001-Make-SoX-support-uclibc-based-toolchains.patch
Applying: Make SoX support uclibc-based toolchains
fatal: empty ident name (for <>) not allowed

Thanks to Arnout who found the issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit aea1dd9b20efc75a911823bc4d8019e9d728eadf)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch b/package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch
index 3d21b570f1..9d004321f7 100644
--- a/package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch
+++ b/package/sox/0001-Make-SoX-support-uclibc-based-toolchains.patch
@@ -1,10 +1,9 @@
-From 5d51acafe9c38fb05939b4d2d6a9dcde12476458 Mon Sep 17 00:00:00 2001
+From a1c913c52f70ee7c70e1e5ae1473ee407cd1494c Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sat, 29 Jun 2024 12:28:54 +0200
+Date: Sat, 17 May 2025 22:12:23 +0200
 Subject: [PATCH] Make SoX support uclibc-based toolchains
 
-From:
-http://sourceforge.net/p/sox/bugs/179/
+From http://sourceforge.net/p/sox/bugs/179/
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Julien: rebased patch on package git version 7524160,
@@ -36,5 +35,5 @@ index 3fcf4382..9fc001bd 100644
    (void)fp;
  #endif
 -- 
-2.45.2
+2.49.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
