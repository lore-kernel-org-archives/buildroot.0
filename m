Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3775C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47C14404F1;
	Wed,  9 Feb 2022 17:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nj4MPJrCtESc; Wed,  9 Feb 2022 17:02:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E0E54049B;
	Wed,  9 Feb 2022 17:02:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED85B1BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E948840146
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Tn9SA5z4-Sx for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C08A400D0
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 19A67FF802;
 Wed,  9 Feb 2022 16:52:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDD-0001Nu-M6; Wed, 09 Feb 2022 17:52:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:51:40 +0100
Message-Id: <20220209165213.4498-75-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 074/107] package/ranger: drop python2 support
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
Cc: Thijs Vermeir <thijsvermeir@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ranger/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ranger/Config.in b/package/ranger/Config.in
index ee0ffecd13..a379002f95 100644
--- a/package/ranger/Config.in
+++ b/package/ranger/Config.in
@@ -4,9 +4,8 @@ config BR2_PACKAGE_RANGER
 	depends on BR2_USE_WCHAR # python3
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
 	depends on !BR2_STATIC_LIBS # python3
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_CURSES if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_CURSES if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_CURSES
 	help
 	  ranger is a console file manager with VI key bindings. It
 	  provides a minimalistic and nice curses interface with a
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
