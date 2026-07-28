Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C394C5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63D0360AB1;
	Fri, 31 Jul 2026 11:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8Qns--bdlse; Fri, 31 Jul 2026 11:58:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 912A8605EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499097;
	bh=czzK2r4Rnt6eZ0/ILKj5JTOqDYVwOOYpFfhPBhBA3U0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fMb0k1/ZGWIr8St3A30Ry9fSnbO+TCZrNTXTDt7Ju5VdtJYiyfbMjM6xcsAXwVqXo
	 PC84OQIkU9/TRlq+S3gFQcBVraxe4aUxm12wvNQe4sV3ysFjqGWnH/q8MxBgxNbpS6
	 dgAHSBeaITZO1DWRyhSYGhPYmhGAFbMKCmJYERHWJ5BoRb2zPgbfNviWruI9ZUIAFT
	 iBGvAbzvYhBRXHXvPmQBqDd809kpVlJJnHHBbv2ubpA81zzAk6KTGIBqYhlJe4Zs0N
	 hmK2c4IsbLTA5URdQA/N5RPIrH5W/xAabBd7pZX3x5uWPsjo62HX+pAQOL8RBkrqQq
	 IQhx+zv0ZyWHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 912A8605EF;
	Fri, 31 Jul 2026 11:58:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89DD6442
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C37F60ACF
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnsyHd2PHrRQ for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA37460AC9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA37460AC9
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F76F8B742; Fri, 31 Jul 2026 11:57:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 11:43:43 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c423b4bc5a41ab3b77007ea5ded518816f7bf4bd
X-Git-Newrev: 58c18022a985230f5df386d2b3d3064c2b013765
X-Patchwork-Hint: ignore
Message-Id: <20260731115729.9F76F8B742@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dbus-broker:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/58c18022a985230f5df386d2b3d3064c2b013765
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 0bbdd304af..77a192177c 100644
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
