Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DB3C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35C4540453;
	Mon,  6 Dec 2021 18:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_dBtHff5MMu; Mon,  6 Dec 2021 18:45:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC99240495;
	Mon,  6 Dec 2021 18:45:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 039521BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D666641C27
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SuQpezciMN-8 for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2ED841C53
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 89BAB81503; Mon,  6 Dec 2021 18:07:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 11:00:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 096418ec4a973124d5b06029c5e841fe6a640fa5
X-Git-Newrev: 066b9a232fdd76c9761fbe128d059796af6c7522
X-Patchwork-Hint: ignore
Message-Id: <20211206180743.89BAB81503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: add optional
 selinux support
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

commit: https://git.buildroot.net/buildroot/commit/?id=066b9a232fdd76c9761fbe128d059796af6c7522
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index a74441163d..91bc6479b8 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -70,6 +70,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += --without-libpsl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+NETWORK_MANAGER_DEPENDENCIES += libselinux
+NETWORK_MANAGER_CONF_OPTS += --with-selinux
+else
+NETWORK_MANAGER_CONF_OPTS += --without-selinux
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 NETWORK_MANAGER_DEPENDENCIES += readline
 NETWORK_MANAGER_CONF_OPTS += --with-nmcli=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
