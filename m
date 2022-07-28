Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82429C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF3660AE0;
	Thu, 28 Jul 2022 21:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EF3660AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2iK-xyWSpdyq; Thu, 28 Jul 2022 21:01:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 676A960A73;
	Thu, 28 Jul 2022 21:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 676A960A73
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CAAE1BF37F
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45B6181304
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45B6181304
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eICxmDNBkoDR for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:00:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EA9E8124C
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EA9E8124C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 624418680D; Thu, 28 Jul 2022 20:47:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 23:00:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dba42986c0197eb26386ebdb8a4de8e506e2c002
X-Git-Newrev: 8b9014e762c9810d09b49c4132d9306fc333ebd6
X-Patchwork-Hint: ignore
Message-Id: <20220728204710.624418680D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zsh: simplify BR2_STATIC_LIBS check
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8b9014e762c9810d09b49c4132d9306fc333ebd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the more common ifeq ($(BR2_STATIC_LIBS),) form.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zsh/zsh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 688c6366e8..8e6f713780 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -44,7 +44,7 @@ else
 ZSH_CONF_OPTS += --disable-pcre
 endif
 
-ifneq ($(BR2_STATIC_LIBS),y)
+ifeq ($(BR2_STATIC_LIBS),)
 # zsh uses TRY_RUN to determine these
 ZSH_CONF_OPTS += \
 	zsh_cv_shared_environ=yes \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
