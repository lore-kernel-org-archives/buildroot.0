Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880C4C5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84425810AC;
	Fri, 31 Jul 2026 11:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lI0xBGCiU9GI; Fri, 31 Jul 2026 11:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8054810BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499016;
	bh=IFhA7ENbS6CWN82D4Y09+kvOXHSyNtEFf9m4lldsIdA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VvMv5A/3HWvEMeq1nm/4WUKHZJ3MMvnlym3MDw6Wsc5FqEsJjd9Wlsv+gGFr0F1UX
	 sGxp3fnUmwEEemdGI2hUWDNbCw2eOMs+EGJMwGClS/jMP7hx/2DR7ojkqQwq7DhYkl
	 /3XliIToFbA82CJldgzT6SH0fqEPhGphhxQTjtRnlQJ+gJUQomL8Jb/NY3FthqFCMI
	 z5b0xJVFR2AgFY+ctZ5NvEh9zrElidh/eRYE3EYb/8cuiOT8r0cTeVbqXHC+pOTTyA
	 mF8yWCUR7EAdUr3nADM656XUWfR0OBzDi51jvzE75x8BfJRUVR9DOVvTkL3miX0IgQ
	 2wxQnEXphe7fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8054810BC;
	Fri, 31 Jul 2026 11:56:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03CFB42A
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8EE981097
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMP0NVYMBb_H for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AB4D81098
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AB4D81098
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F3D08B745; Fri, 31 Jul 2026 11:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 11:43:44 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: aa039e5df0941f4c463d32739a72cfebb35a6b4a
X-Git-Newrev: 9cb109e5b33404010a22f688b7c45d25b5c4d79c
X-Patchwork-Hint: ignore
Message-Id: <20260731115605.6F3D08B745@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/dbus-broker:
 clarify license information
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9cb109e5b33404010a22f688b7c45d25b5c4d79c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

All these bundled subprojects explicitly give "Apache-2.0 OR
LGPL-2.1-or-later" in their README.md files.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0c2b14a8b5537b23ad5beda705427d4943ba72e3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dbus-broker/dbus-broker.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index 7e029879f9..869eec462b 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -10,7 +10,7 @@ DBUS_BROKER_SITE = https://github.com/bus1/dbus-broker/releases/download/v$(DBUS
 
 DBUS_BROKER_LICENSE = \
 	Apache-2.0, \
-	Apache-2.0 and/or LGPL-2.1+ (c-dvar, c-ini, c-list, c-rbtree, c-shquote, c-stdaux, c-utf8)
+	Apache-2.0 or LGPL-2.1+ (bundled subprojects c-dvar, c-ini, c-list, c-rbtree, c-shquote, c-stdaux, c-utf8)
 # For the third-party code, the licensing legal-info is inconsistent between
 # the AUTHORS and README, so keep both
 DBUS_BROKER_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
