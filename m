Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1F7CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB76C412B0;
	Thu, 19 Sep 2024 09:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wizf1BwcvnUJ; Thu, 19 Sep 2024 09:15:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCDD741337
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCDD741337;
	Thu, 19 Sep 2024 09:15:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B8941BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B15342802
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6j10zIsJVf3h for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 932EA42643
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 932EA42643
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9007B83C66; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:23 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 530bfe46dc17794690a4272b951070fc4d3e6eb4
X-Git-Newrev: 82b82594e8d0697e03539c883657aaa4f13fb808
X-Patchwork-Hint: ignore
Message-Id: <20240919091452.9007B83C66@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/dvblast: fix
 which typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=82b82594e8d0697e03539c883657aaa4f13fb808
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1a05d2f16ffe77d0572674d74cd13419c7cc69cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dvblast/0001-missing-lm.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dvblast/0001-missing-lm.patch b/package/dvblast/0001-missing-lm.patch
index 2efbec4648..f287db5819 100644
--- a/package/dvblast/0001-missing-lm.patch
+++ b/package/dvblast/0001-missing-lm.patch
@@ -1,6 +1,6 @@
 dvblast: fix static linking
 
-dvblast links to -lev, wihch uses functions from the maths library,
+dvblast links to -lev, which uses functions from the maths library,
 like floor().
 
 When linking to a shared libev.so, that dependency is automatically
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
