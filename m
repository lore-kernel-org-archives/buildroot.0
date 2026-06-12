Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB36CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E32E5809F8;
	Fri, 12 Jun 2026 16:34:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOZ-HHwNB9Fa; Fri, 12 Jun 2026 16:34:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 153C2807EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781282061;
	bh=bZSkNBdWCmgnrXtDsBGqJ+7BVvKfgd1zSS2dAv0No2g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GSaP9RCdsAnsanSnCMp7aoVn+seJ6WqRISS7YRtuEWhFYtfvRC/jSLChK8MQlLQFL
	 hU2Nd9CinhUD/YRaI0HO3L9NaixdZ5RaNySHp5seWy/7Sw9Qd7sr+heG2+yCvfu+ZY
	 XP/1A2wE6MW6RPqmGCluD5CIt9cv+Vpa+8PKWMKqhb3LRtnZ3akA+OlLSQ2Zeau4bf
	 atLs66h4JsX1K1rsvLEqJcYlx2YBL9xdHDmWUimjMnnRMIRNDijyjcsFdDljpjporK
	 VzB1spxKv6Y6G7X67cowNjYuVEokYuRgYetF2/WVz6CIwoatTx3/DdU1Y46mTBJxJe
	 FagoC1TKf2g3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 153C2807EB;
	Fri, 12 Jun 2026 16:34:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22D1412F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:34:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20C2440717
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:34:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GinheCvVaZzA for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:34:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 450EA4070C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 450EA4070C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:34:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED2FB8811C; Fri, 12 Jun 2026 16:33:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 18:33:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1afc7aa33457c4528b373eb695403b73a6318df2
X-Git-Newrev: 1deac1ac39e79eb8f37dc276710c70d135cf4d31
X-Patchwork-Hint: ignore
Message-Id: <20260612163359.ED2FB8811C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdbus-cpp: bump to version 2.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1deac1ac39e79eb8f37dc276710c70d135cf4d31
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

fixes an ABI break in 2.3.0

changelog:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.3.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index db1c5d5fee..839757cdcb 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  8c01d28fa7b1a973d7a9cfdfd65480e733a52172506eaa1fea225b681590fe3c  sdbus-cpp-2.3.0.tar.gz
+sha256  3a289eded586c26d06c1387de72c7bf7c809527a70d51ba6401fe61059b19626  sdbus-cpp-2.3.1.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index d8743c66b3..ad5f999c5c 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 2.3.0
+SDBUS_CPP_VERSION = 2.3.1
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
 SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
