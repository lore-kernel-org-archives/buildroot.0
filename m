Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977AFCDD555
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 652524126D;
	Wed, 18 Sep 2024 20:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COQCBr5gJGDY; Wed, 18 Sep 2024 20:36:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A999241283
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A999241283;
	Wed, 18 Sep 2024 20:36:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1CE1BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77C478475C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbmkLeMk058p for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A6A884916
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A6A884916
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2588783BE3; Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 22:19:08 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: dfcce6c6b3436ee2d3bb1134ea92bd40ee6adba8
X-Git-Newrev: 2c96b9b395aa2944480dc50285d43a949a0625a5
X-Patchwork-Hint: ignore
Message-Id: <20240918203458.2588783BE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/aer-inject:
 switch upstream
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
Content-Type: multipart/mixed; boundary="===============5976363012470811832=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5976363012470811832==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2c96b9b395aa2944480dc50285d43a949a0625a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

According to a commit in Linux[1], the upstream of aer-inject changed to
https://github.com/intel/aer-inject.

[1]: https://git.kernel.org/linus/a29e5290e3566ae4db4e6fe5f31caf23118c82b6

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e40c6f2156cd59082fd02c37b24c3a2750eee809)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aer-inject/aer-inject.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/aer-inject/aer-inject.mk b/package/aer-inject/aer-inject.mk
index 6bc9cb44da..7516ef63ac 100644
--- a/package/aer-inject/aer-inject.mk
+++ b/package/aer-inject/aer-inject.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 AER_INJECT_VERSION = 9bd5e2c7886fca72f139cd8402488a2235957d41
-AER_INJECT_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
+AER_INJECT_SITE = https://github.com/intel/aer-inject.git
 AER_INJECT_SITE_METHOD = git
 AER_INJECT_LICENSE = GPL-2.0
 AER_INJECT_LICENSE_FILES = README

--===============5976363012470811832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5976363012470811832==--
