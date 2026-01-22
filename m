Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18084D6CFA3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3B2840910;
	Thu, 22 Jan 2026 19:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgXKk-9jH-cB; Thu, 22 Jan 2026 19:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA42640918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769109113;
	bh=ukChi2ON7a6+59oaAD2Z2dgzK/F8AN3hRQuLpbTQuEA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZOh7g3Yk3hFk7mCmUJzYCJGreYBUbrGOspDGw99yRt7UmDj6ApmxmobrOAoHJa9Od
	 RTFDD3/UgASAzKnUxpRoVKg647QkxvQd0PzgJXu31u7Y6foSZpubpu5kVY1E6Mcvnl
	 bzJRaEuiMBapR6BTpgHvfWQGgWMDdweQ/dlfzGr8T3WP+F5Pch6kI12c45azxxy7Mh
	 xwzteEziv1yrAyRLYweDS2FWtEag24fErCkEHyjzeZGDaNAs4Hiav2gnmf+Rn5kJ3i
	 iNZc7spaIyqRFKAeo6k5XZVFsWjskGoAgYBxRjKjRTriacBDuUMbSoQurXxz8+Kh5a
	 6hWrN1SKWJhHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA42640918;
	Thu, 22 Jan 2026 19:11:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65EB771F
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 503A440918
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8cUiELpfmNLh for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A28340910
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A28340910
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:11:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78D3F86967; Thu, 22 Jan 2026 19:11:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:10:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b521d33078fc4ff67935dedf180532969db39ec
X-Git-Newrev: 04b64c8502cdb809b10ec6c01e4d408fcdca4a14
X-Patchwork-Hint: ignore
Message-Id: <20260122191151.78D3F86967@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: bump version to 2.92
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

commit: https://git.buildroot.net/buildroot/commit/?id=04b64c8502cdb809b10ec6c01e4d408fcdca4a14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG

Release notes:
https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2026q1/018380.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 212774cd10..258f0b1e93 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.91.tar.xz.asc
-sha256  f622682848b33677adb2b6ad08264618a2ae0a01da486a93fd8cd91186b3d153  dnsmasq-2.91.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.92.tar.xz.asc
+sha256  4bf50c2c1018f9fbc26037df51b90ecea0cb73d46162846763b92df0d6c3a458  dnsmasq-2.92.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index dec7c9a86d..74fc053089 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.91
+DNSMASQ_VERSION = 2.92
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
