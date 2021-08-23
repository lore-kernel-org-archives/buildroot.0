Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B1DC4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 12:57:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C149613AD
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 12:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C149613AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC90880D07;
	Mon, 23 Aug 2021 12:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uNO8J98QK56V; Mon, 23 Aug 2021 12:56:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0BB180D21;
	Mon, 23 Aug 2021 12:56:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 436631BF2BB
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 12:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32FA480D21
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 12:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AhhoyUvojlec for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 12:56:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63E1C80D07
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=bhUVrUf1h7vr1A7r/zynpX5lXhzzl6Udj40h7jIh8To=; 
 b=TJSnm7OSh2F4R1uv90AkVVJzTcNf4dhRnnPdbUQviVFne2LQbH5EU/xoacmalCHP/IfJGFD38JEhIGWYx5l3vIsfWQP5Oe0dlMaJU/YojUmwqj5MxnJglBF3GQOZ0zdJiZWRJ6adlY48010WVqGnji0mKaCVvuldXZe0vqBpFRq5hEBBLsrd79/alWx/RihX4tgx79sYgJ4j6XQh4pstMsjL8pFU+fszd03cG6ot7xP8ZjCPQeOeHevWzkwjVrHmbx4FtwNNyEaUkQm2uiN4c9oqDS7j1dKnYdD8bd+9M29VBqO3cs7p5KPi1k/vqWMHPhLjKj65MU2LvAreMwXwKQ==;
Received: from 91-153-34-142.elisa-laajakaista.fi ([91.153.34.142] helo=kodama)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mI9VK-0003ek-02; Mon, 23 Aug 2021 14:56:42 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 840b28ca;
 Mon, 23 Aug 2021 12:56:28 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 23 Aug 2021 15:56:28 +0300
Message-Id: <20210823125628.2838501-1-aperez@igalia.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/bubblewrap: bump to version
 0.5.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Not much new, but has a few interesting bug fixes. Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.5.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/bubblewrap/bubblewrap.hash | 4 ++--
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index d3ccb4cb1f..88aba150cd 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,5 @@
-# Locally computed:
-sha256  b9c69b9b1c61a608f34325c8e1a495229bacf6e4a07cbb0c80cf7a814d7ccc03  bubblewrap-0.4.1.tar.xz
+# From https://github.com/containers/bubblewrap/releases/tag/v0.5.0
+sha256  16fdaf33799d63104e347e0133f909196fe90d0c50515d010bcb422eb5a00818  bubblewrap-0.5.0.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 18c175951a..5f3d95e826 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.4.1
+BUBBLEWRAP_VERSION = 0.5.0
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
