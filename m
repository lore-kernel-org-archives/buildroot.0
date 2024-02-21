Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50672C48BF6
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 14:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09FF48220C;
	Wed, 21 Feb 2024 14:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THaTqoU4YpRE; Wed, 21 Feb 2024 14:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2232282212
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2232282212;
	Wed, 21 Feb 2024 14:30:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 049F11BF4D8
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 14:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E65BB8220C
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 14:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWsc3zEfJgvl for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 14:30:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.84.136;
 helo=mail.desaster-games.net; envelope-from=jubalh@iodoru.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C517682204
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C517682204
Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by smtp1.osuosl.org (Postfix) with ESMTP id C517682204
 for <buildroot@busybox.net>; Wed, 21 Feb 2024 14:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.desaster-games.net (Postfix) with ESMTP id 7536F5;
 Wed, 21 Feb 2024 15:30:28 +0100 (CET)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
 by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xe90DliPyRL1; Wed, 21 Feb 2024 15:30:15 +0100 (CET)
Received: from ymir.nue2.suse.org (unknown [81.95.8.245])
 by mail.desaster-games.net (Postfix) with ESMTPSA id 1E5948;
 Wed, 21 Feb 2024 15:30:15 +0100 (CET)
From: Michael Vetter <jubalh@iodoru.org>
To: buildroot@busybox.net
Date: Wed, 21 Feb 2024 15:30:01 +0100
Message-Id: <20240221143001.30174-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=iodoru.org
Subject: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version 0.13.1
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
Cc: Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 package/libstrophe/libstrophe.hash | 2 +-
 package/libstrophe/libstrophe.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index e284e8cca6..ec5a55985a 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8d7c17c694efff7d2e2d3632684537e7ba874ce3d7f0e750a539f2299021bbaa  libstrophe-0.13.0.tar.xz
+sha256  86c0abd348ae66feb40b6886f2c7f04525f1d5b20a48c10d4db4ed532dc63f22  libstrophe-0.13.1.tar.xz
 sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index 257593bbec..42d582fe9c 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.13.0
+LIBSTROPHE_VERSION = 0.13.1
 LIBSTROPHE_SOURCE = libstrophe-$(LIBSTROPHE_VERSION).tar.xz
 LIBSTROPHE_SITE = https://github.com/strophe/libstrophe/releases/download/$(LIBSTROPHE_VERSION)
 LIBSTROPHE_DEPENDENCIES = host-pkgconf
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
