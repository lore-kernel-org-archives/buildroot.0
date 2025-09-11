Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E59CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCC4B6F5B2;
	Thu, 11 Sep 2025 20:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBQ6IDMQZo3R; Thu, 11 Sep 2025 20:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55C256F5A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55C256F5A2;
	Thu, 11 Sep 2025 20:09:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F7DA234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 713E06F5AC
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygb8R1QpZbpe for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7DE16F5A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7DE16F5A2
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:09:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A665A8439F; Thu, 11 Sep 2025 20:09:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:04:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2a861a861350b9be5df4fdff3a1f4893191f2c0
X-Git-Newrev: 122d1d1fbd63e775587f58620498276c60fa80cd
X-Patchwork-Hint: ignore
Message-Id: <20250911200941.A665A8439F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lv2: drop optional dependency on
 libgtk2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=122d1d1fbd63e775587f58620498276c60fa80cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove libgtk2, let's drop the optional dependency
of lv2 on libgtk2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/lv2/lv2.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/lv2/lv2.mk b/package/lv2/lv2.mk
index 2dde9b907c..cef90d13f0 100644
--- a/package/lv2/lv2.mk
+++ b/package/lv2/lv2.mk
@@ -24,10 +24,6 @@ ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LV2_DEPENDENCIES += libsndfile
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-LV2_DEPENDENCIES += libgtk2
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 LV2_CONF_OPTS += -Dplugins=disabled
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
