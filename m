Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65190F9D0EC
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E73E84DDA;
	Tue, 14 Apr 2026 17:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THjcGK7DiQ9n; Tue, 14 Apr 2026 17:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FE9D83D38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188944;
	bh=qCzAVnDF5SFjKHoonfLrvNXP6b/xQjt5n4pkCkjr/Z4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FDjrECuerMYBYyOKJ4swI8uYx1la+VvDUahwu+GFLTf4FrYo79fH9ZRqNR2vtaAzg
	 S9ffzTf41cpKPaVbKHDkHKvlHTTyzL+h6wO2sWT3vbm97gw9bNrqukUFMaPgbsCa88
	 8Yr+AQKsNt2p0eg/L0dL85wUlCSTMJGUeVFe4GDxgxe0DgMErFOjwZf7CJOjHHB0/C
	 yPaSN2WcxC4Gazg4tSwcuJV+uOZWJnVmAZdpfwOLHx8YaEotkKYNJTWN5chcIx3WGj
	 8Qf6UqkSt1EXexv5WrNI/gWoheTN8p/07aoVLmGkMi7sxdMEZcjquVDWhFnlCPVxXN
	 dFKnTrZf8tvKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FE9D83D38;
	Tue, 14 Apr 2026 17:49:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60DB4375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41AAE83D38
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGVCOzDJIxrN for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86BDF83CD1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86BDF83CD1
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05CAC7FB24; Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f99d5f46e29ed853d2fb288091457fb8e23cdf8e
X-Git-Newrev: 0aa8a91bb82f5474aa35f15bb626f7bad5bbbf2f
X-Patchwork-Hint: ignore
Message-Id: <20260414174852.05CAC7FB24@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgis: switch to pcre2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0aa8a91bb82f5474aa35f15bb626f7bad5bbbf2f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream added additional and optional support for pcre2 in version
3.2.0:
https://github.com/postgis/postgis/commit/6cf2fba94a434e79d6526a6a5cfdb6057a91bff8
which was added to buildroot in 2021 with commit
5084994d3f6dce350de091cd813047e658b9363d.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/postgis/postgis.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgis/postgis.mk b/package/postgis/postgis.mk
index 42511536aa..0a55ee0e58 100644
--- a/package/postgis/postgis.mk
+++ b/package/postgis/postgis.mk
@@ -33,8 +33,8 @@ else
 POSTGIS_CONF_OPTS += --without-raster
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-POSTGIS_DEPENDENCIES += pcre
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+POSTGIS_DEPENDENCIES += pcre2
 endif
 
 ifeq ($(BR2_PACKAGE_PROTOBUF_C),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
