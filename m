Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1990DEDE9BF
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE4661101;
	Tue, 10 Sep 2024 20:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCHFN5sUq5Tg; Tue, 10 Sep 2024 20:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C977C6111F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C977C6111F;
	Tue, 10 Sep 2024 20:53:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E50C1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D1DB409F1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQc9tAetqJ3M for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07E2540905
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07E2540905
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F309986F5F; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c046460d2b120816478b4ae82793e7617e80f7c
X-Git-Newrev: 2619c021891daed6a1dfce4bacecf825434108cd
X-Patchwork-Hint: ignore
Message-Id: <20240910205130.F309986F5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcusdk: fix definition typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=2619c021891daed6a1dfce4bacecf825434108cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0002-eibd-fix-endless-recursion-when-using-USB-backends.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch b/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch
index 3b90289c88..c31f0c0c8c 100644
--- a/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch
+++ b/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] eibd: drop local clock_gettime in USB backends
 clock_gettime is defined locally, and calls pth_int_time, which
 in turn calls clock_gettime.
 The USB backend shouldn't overrule clock_gettime in the first place.
-This patch fixes this endless recursion by removing the local defition.
+This patch fixes this endless recursion by removing the local definition.
 
 Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
