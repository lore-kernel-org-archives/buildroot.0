Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6B4CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC1708592D;
	Tue,  9 Jun 2026 13:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICxo-nnOTFDH; Tue,  9 Jun 2026 13:03:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B918A85840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010175;
	bh=yOEDumgBsAGpu67ep28mIAK4roE+MgVafn1W+KF+Oe8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tIYbfpbHfCwKu55AwEKOOwftTv74llPaPb4aCF78eimdFqt+tW8q27c1tM4roVNBA
	 klrDr31XkpzWHe7hA2n+XtLZNolbnzGIE8Yo1JVapsCTxgZItJvWKAp0kTFsYv7fqy
	 Utu964KgTOxKzmj7cx2DqqQuqTJxg0vXNam3UeF7M1TRkWpm03L+dU6Qj6M+Kd/lHY
	 ujjBUdpSTTFBUKFvbp5tFUAWxrOw16zGtuXcQsaRHI+no3WoQJUy8mAi57VypOIQLs
	 4VGFIx7HdYP6fDkhdIRuxqGt0DvvSe6ZUbpPFcWbSj+wz8EeXV7bvVGkIZ8LmwAm5e
	 x9C94zy9/LMtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B918A85840;
	Tue,  9 Jun 2026 13:02:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BC6B196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 800F84229D
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aVgHZpW38Rw0 for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DED5E4242C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DED5E4242C
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2655587E8D; Tue,  9 Jun 2026 13:01:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 May 2026 13:35:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1140401f6832f42d0c0c92f1e03c53c778576a1e
X-Git-Newrev: a630ba2e32c324f08cefb3a810215450f6e4167a
X-Patchwork-Hint: ignore
Message-Id: <20260609130118.2655587E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpqxx: bump version to 7.10.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a630ba2e32c324f08cefb3a810215450f6e4167a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jtv/libpqxx/blob/7.10.7/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpqxx/libpqxx.hash | 2 +-
 package/libpqxx/libpqxx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 067a2c8d2a..42c7941795 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e578677d0c1b0f7ad37ac2d9ac373bc9738a3732083c70672da5f2c3028e6b03  libpqxx-7.10.4.tar.gz
+sha256  8c09cf20d57695621376f34d6da24c2c40c28408ab3b7ca92dc661ff9ad4b906  libpqxx-7.10.7.tar.gz
 sha256  2ccd31347a87796860a6600f57bf97ff4d54c203ecce4ea040425ba79774cf5f  COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index 492370f7f5..3781128c5c 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 7.10.4
+LIBPQXX_VERSION = 7.10.7
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
