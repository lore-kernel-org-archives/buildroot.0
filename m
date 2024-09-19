Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0011CE8D62
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A08CB410FF;
	Thu, 19 Sep 2024 09:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gv77qBY7svNC; Thu, 19 Sep 2024 09:15:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8DE6414BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8DE6414BA;
	Thu, 19 Sep 2024 09:15:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A2531BF97E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 313BD427F4
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoFCraNOxPAF for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47E8C427FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47E8C427FC
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 448EE83C39; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:35 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 506c14d8e1ff272c7ad4a3653d3d131030b9fb3f
X-Git-Newrev: 78e646240fc79d08efd9c3f73042f8aef3f6e34e
X-Patchwork-Hint: ignore
Message-Id: <20240919091453.448EE83C39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/go: fix
 convenience typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=78e646240fc79d08efd9c3f73042f8aef3f6e34e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5aa9b105b96dda4d0db6fc11f4c8abe09a63ed33)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/go/go.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index 660c7a9bad..91aa31f76c 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -65,7 +65,7 @@ else ifeq ($(BR2_s390x),y)
 GO_GOARCH = s390x
 endif
 
-# For the convienience of target packages.
+# For the convenience of target packages.
 HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
 HOST_GO_TARGET_ENV = \
 	$(HOST_GO_COMMON_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
