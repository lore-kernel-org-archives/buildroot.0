Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDABC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21FF482F87;
	Sun,  5 Dec 2021 10:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pO1bTMV7DXP2; Sun,  5 Dec 2021 10:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84EAA82F57;
	Sun,  5 Dec 2021 10:06:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5654C1BF96B
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 520E940248
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjOv0YVYf74b for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:06:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B0A740105
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1438F947D7; Sun,  5 Dec 2021 10:01:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 10:59:14 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f3fb04609a88ded77034c7fa47ef19bdcafd6653
X-Git-Newrev: b69e3020f5de5d6f3b306abba1317045ae72b7b5
X-Patchwork-Hint: ignore
Message-Id: <20211205100108.1438F947D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/network-manager: add
 optional libaudit support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b69e3020f5de5d6f3b306abba1317045ae72b7b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 856b225985..e102e29b34 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -49,6 +49,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += --without-iwd
 endif
 
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+NETWORK_MANAGER_DEPENDENCIES += audit
+NETWORK_MANAGER_CONF_OPTS += --with-libaudit
+else
+NETWORK_MANAGER_CONF_OPTS += --without-libaudit
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 NETWORK_MANAGER_DEPENDENCIES += libcurl
 NETWORK_MANAGER_CONF_OPTS += --enable-concheck
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
