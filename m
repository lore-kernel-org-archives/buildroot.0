Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F7FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 13:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD917408E0;
	Sun, 19 Jun 2022 13:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD917408E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrWTGX8YBMFq; Sun, 19 Jun 2022 13:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5786408D2;
	Sun, 19 Jun 2022 13:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5786408D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 840511BF852
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C8BA408D2
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 13:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C8BA408D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edy6QZNUWKbq for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 13:49:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51315408AE
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 13:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51315408AE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4ABE087334; Sun, 19 Jun 2022 13:37:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 15:48:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: db6a40e758f82b3caaf434204a0e2b036a18a5c1
X-Git-Newrev: 2c34a06e8ae5041c62b15ef5d795b1836809088e
X-Patchwork-Hint: ignore
Message-Id: <20220619133712.4ABE087334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/luajit: add
 BR2_aarch64_be support
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c34a06e8ae5041c62b15ef5d795b1836809088e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

ARM64 big-endian is supported since
https://github.com/LuaJIT/LuaJIT/commit/3143b218946395834f0bfef741061ac6ef3f5b56

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 28e5c2f2bdd147dbb9aefbc040fc618f46ee0663)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luajit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index d890d65b10..31e9e0243e 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_aarch64
+	default y if BR2_arm || BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_i386 || BR2_x86_64
 	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
 		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
