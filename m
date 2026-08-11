Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB388C5B56A
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 19:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81C226089D;
	Tue, 11 Aug 2026 19:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MM3WSE1XN9v; Tue, 11 Aug 2026 19:07:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A679E60708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786475243;
	bh=xjWjlJB1rRd1UHPJFSAB7OA2vYbF+8QXTBl49RF/6PY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ltp49MautKFkhCRifnal2mFgusGhNYJN3myYPE2f7xRxuuiBHuJdFRHM2XlWrpvMz
	 5pIZu0meK0dKZMvj6/BdZFCjWEx01acSk2I775J7BHfUHFCq3VuSihZikM7RejgQN6
	 zhpBLOGMUHJ9PzAIeCLBPr+KOgugSB7sqATdpOKMU4TpwOZjwaNae+GwP54tfJ92HB
	 3TrzV4pKY6i2WTKdu2j5qXDGvXE/NYOfUnMWV4z+7vhtdUBJvCcVfZ2ZuXaoHZTmaD
	 FnSKTGywWvJO/266xn19XDEZIEuTjJ1ZgzkVy+Gytqm3fcuoUw9p3842ITfRboyyjM
	 fYc6ABogYA0SA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A679E60708;
	Tue, 11 Aug 2026 19:07:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3586540A
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27A9E4046C
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9rmOMoYMkCY for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 19:07:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7641E40426
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7641E40426
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:07:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2B858D2F1; Tue, 11 Aug 2026 19:06:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Aug 2026 20:54:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1209f3f7a1daf68cdf1846af9a014d769d1e0a68
X-Git-Newrev: a3a53b05f8cf25a55306dd0301dd6b310752b09c
X-Patchwork-Hint: ignore
Message-Id: <20260811190633.D2B858D2F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: switch download site to
 https
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a3a53b05f8cf25a55306dd0301dd6b310752b09c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/redis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 7829aa6143..0105f2b77c 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 REDIS_VERSION = 8.8.1
-REDIS_SITE = http://download.redis.io/releases
+REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
 	MIT and BSD family licenses (Bundled components)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
