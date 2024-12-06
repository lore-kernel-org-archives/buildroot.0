Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA079E77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 22:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6556480EB5;
	Fri,  6 Dec 2024 22:55:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQOkFBZZHmW0; Fri,  6 Dec 2024 22:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6529480E0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6529480E0C;
	Fri,  6 Dec 2024 22:55:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EAF4ED8
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9DEC40347
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xR4W_xavyv5x for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 22:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 029ED402BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 029ED402BB
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:55:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4CE286B35; Fri,  6 Dec 2024 22:55:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 23:29:35 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 63e6f819b9f647ec6fc158e81346d5314f896ec0
X-Git-Newrev: cd0e1ef28d79cb14584927e515e93a8748bc4c9a
X-Patchwork-Hint: ignore
Message-Id: <20241206225524.E4CE286B35@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/alsa-lib: ucm:
 add BR2_USE_MMU dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd0e1ef28d79cb14584927e515e93a8748bc4c9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Build fails with:
ucm_exec.c: In function 'uc_mgr_exec':
ucm_exec.c:229:13: error: implicit declaration of function 'fork' [-Wimplicit-function-declaration]
  229 |         p = fork();
      |             ^~~~

ucm uses fork() so add BR2_USE_MMU dependency for it.

Fixes: https://autobuild.buildroot.org/results/a287d3eef7ea5ea9a85b5b35d14e3698df4ecd01/build-end.log
Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 928494b7859e1b2ab44d56a17dc8fcec8a661780)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 447916a29f..6df03afe0e 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -69,6 +69,7 @@ config BR2_PACKAGE_ALSA_LIB_SEQ
 config BR2_PACKAGE_ALSA_LIB_UCM
 	bool "ucm"
 	default y
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ALSA_LIB_MIXER
 
 config BR2_PACKAGE_ALSA_LIB_ALISP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
