Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE02C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7879340897;
	Wed,  9 Feb 2022 16:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78NnxNlBema4; Wed,  9 Feb 2022 16:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2A5D4099F;
	Wed,  9 Feb 2022 16:55:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1DA1BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64ED6403F8
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VM79LOOKUjTT for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:52:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84A6E40146
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8B0602000A;
 Wed,  9 Feb 2022 16:52:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCn-0001Fv-4t; Wed, 09 Feb 2022 17:52:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:48 +0100
Message-Id: <20220209165213.4498-23-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 022/107] package/libevent: drop python2 support
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libevent/libevent.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 93ba88ca88..4c23156f72 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -25,7 +25,7 @@ endef
 
 # libevent installs a python script to target - get rid of it if we
 # don't have python support enabled
-ifneq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+ifneq ($(BR2_PACKAGE_PYTHON3),y)
 LIBEVENT_POST_INSTALL_TARGET_HOOKS += LIBEVENT_REMOVE_PYSCRIPT
 endif
 
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
