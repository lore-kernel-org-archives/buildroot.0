Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1F9C54E5D
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC88D406E8;
	Tue, 19 Mar 2024 12:22:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BelPHztxrPvB; Tue, 19 Mar 2024 12:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 549E24072F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 549E24072F;
	Tue, 19 Mar 2024 12:22:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CB921BF406
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18A0481E57
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qElL2ysfVIoD for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54AA881E6B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54AA881E6B
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41F7F8354C; Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 13:07:49 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 0f15942e9094ca4d200ba8a7e1e799a566282dcb
X-Git-Newrev: c9e929651d4f4db1d5e59db7da89a7410b049279
X-Patchwork-Hint: ignore
Message-Id: <20240319122222.41F7F8354C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/conmon: fix build
 with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9e929651d4f4db1d5e59db7da89a7410b049279
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix the following build failure with gcc 4.8 raised since the addition
of the package in commit 06f50ff1bf066feb6cf6ed512113773f87c884fb:

src/conmon.c:5:2: error: #error conmon.c requires C99 or later
 #error conmon.c requires C99 or later
  ^

Fixes: 06f50ff1bf066feb6cf6ed512113773f87c884fb
 - http://autobuild.buildroot.org/results/b573aceefde04435ea13dfd2a48f9c2372bde4d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8077efb83769d43f976f7159f2c861e20163c96e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/conmon/conmon.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index 214cb460a5..1e57786686 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -25,7 +25,8 @@ define CONMON_CONFIGURE_CMDS
 endef
 
 define CONMON_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS) -std=c99" \
 		LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D) bin/conmon
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
