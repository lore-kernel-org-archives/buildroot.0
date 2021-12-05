Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9388C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 10:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 801A582F80;
	Sun,  5 Dec 2021 10:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QyfhWvmDgUsC; Sun,  5 Dec 2021 10:07:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2A1C82F57;
	Sun,  5 Dec 2021 10:07:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A70791BF283
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D40F40105
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 10:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbFvmU44a-Xv for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 10:06:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99CD9401F7
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 10:06:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 43CE0947D7; Sun,  5 Dec 2021 10:01:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 11:02:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f4d2d927fddb59e0648442b03ccac234742f1d42
X-Git-Newrev: 33ad16bea96f3068c27c7282d8aaa7a03c42bc15
X-Patchwork-Hint: ignore
Message-Id: <20211205100108.43CE0947D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/network-manager: use
 with/without instead of with=yes/with=no
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

commit: https://git.buildroot.net/buildroot/commit/?id=33ad16bea96f3068c27c7282d8aaa7a03c42bc15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is more consistent with what is done in Buildroot packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 7213b69e15..40da992089 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -79,16 +79,16 @@ endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 NETWORK_MANAGER_DEPENDENCIES += readline
-NETWORK_MANAGER_CONF_OPTS += --with-nmcli=yes
+NETWORK_MANAGER_CONF_OPTS += --with-nmcli
 else
-NETWORK_MANAGER_CONF_OPTS += --with-nmcli=no
+NETWORK_MANAGER_CONF_OPTS += --without-nmcli
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_TUI),y)
 NETWORK_MANAGER_DEPENDENCIES += newt
-NETWORK_MANAGER_CONF_OPTS += --with-nmtui=yes
+NETWORK_MANAGER_CONF_OPTS += --with-nmtui
 else
-NETWORK_MANAGER_CONF_OPTS += --with-nmtui=no
+NETWORK_MANAGER_CONF_OPTS += --without-nmtui
 endif
 
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_PPPD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
