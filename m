Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E088AF9D0D5
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B53A542C06;
	Tue, 14 Apr 2026 15:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYysjCTjT1Ao; Tue, 14 Apr 2026 15:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C830B42C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181787;
	bh=cFbR9r5A33+yPgVyoDoi4/dH4aXdstTjjFThmoxMkCE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kgKfZGdd1U/rpDI50sfexOX3Au69rA7WylRpq0XbErcBDPdyDWwYX/KlzQazGUj2d
	 zwsnMVOXWtrfPn/cCOlW/3rtuAUQY7cAhVVBKkVYtrcBcP5M4RnkE5ugDQm4jFr9cZ
	 O6kR3+Ei8xPeeJ5VeaQp0ZrMPRniqLp66O9quVuVtUixF9dcVZ0xXE20wMmBMGxDEx
	 6KudK5dX8R9N2pqWiCpSEzsCc0U7zF7RCLLo5LtYkif3qx1KG4cy/Rmnj4M7zvm+ST
	 AQH1tVShxetNCbqImr3Qu17Tsdwjk+qxRBGD0fEaNvOrz2d9gC67qdVOOUGqHk9+6g
	 LRP3yZ8gIqqbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C830B42C3E;
	Tue, 14 Apr 2026 15:49:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 015F6283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84C6E42B2E
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTVAR1dvvaPg for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 244F942B19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 244F942B19
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAE7981510; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 14:09:27 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 1125238c9f4d83d3504eaab03f3fb47ee44155c5
X-Git-Newrev: cb34aef3f8e16684cfccda1a4d8aca130f5aceb8
X-Patchwork-Hint: ignore
Message-Id: <20260414154926.BAE7981510@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 package/freeradius-server: remove redundant pcre dependency
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb34aef3f8e16684cfccda1a4d8aca130f5aceb8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit 736c4c1655d93652a9a7e79235bbe726b3d46176 added the
package with two identical code blocks dealing with the dependency to
pcre:

https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/package/freeradius-server/freeradius-server.mk#L161
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/package/freeradius-server/freeradius-server.mk#L218

Remove one of these code blocks.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6c3a015a5e12f8027c926d81d506f0d63012d104)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freeradius-server/freeradius-server.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 946750f1a5..9b5b3d13ea 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -215,13 +215,6 @@ FREERADIUS_SERVER_CONF_OPTS += \
 	--without-rlm_eap_pwd
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-FREERADIUS_SERVER_CONF_OPTS += --with-pcre
-FREERADIUS_SERVER_DEPENDENCIES += pcre
-else
-FREERADIUS_SERVER_CONF_OPTS += --without-pcre
-endif
-
 ifeq ($(BR2_PACKAGE_RUBY),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_ruby
 FREERADIUS_SERVER_DEPENDENCIES += ruby
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
