Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F20C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B330783268;
	Sun,  5 Dec 2021 10:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gRVvQU7CzSKG; Sun,  5 Dec 2021 10:06:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EAD583103;
	Sun,  5 Dec 2021 10:06:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60E6B1BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F0356066B
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HtRnGDamgnz9 for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:06:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 767766069C
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1E105947D8; Sun,  5 Dec 2021 10:01:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 10:59:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b69e3020f5de5d6f3b306abba1317045ae72b7b5
X-Git-Newrev: 096418ec4a973124d5b06029c5e841fe6a640fa5
X-Patchwork-Hint: ignore
Message-Id: <20211205100108.1E105947D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/network-manager: add
 optional libpsl support
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

commit: https://git.buildroot.net/buildroot/commit/?id=096418ec4a973124d5b06029c5e841fe6a640fa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index e102e29b34..a74441163d 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -63,6 +63,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += --disable-concheck
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPSL),y)
+NETWORK_MANAGER_DEPENDENCIES += libpsl
+NETWORK_MANAGER_CONF_OPTS += --with-libpsl
+else
+NETWORK_MANAGER_CONF_OPTS += --without-libpsl
+endif
+
 ifeq ($(BR2_PACKAGE_READLINE),y)
 NETWORK_MANAGER_DEPENDENCIES += readline
 NETWORK_MANAGER_CONF_OPTS += --with-nmcli=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
