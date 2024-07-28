Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F89C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 10:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F084880C4B;
	Sun, 28 Jul 2024 10:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjCzWW3l_9Es; Sun, 28 Jul 2024 10:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8795D80AF7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8795D80AF7;
	Sun, 28 Jul 2024 10:25:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E86401BF955
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2DAB4014D
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ty1_bFb-6mng for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 10:24:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF1254011A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF1254011A
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 10:24:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA9BB8751C; Sun, 28 Jul 2024 10:24:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 12:05:09 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7fd63a9ef6a6e1851e7347a1fe3fe28fc1fab504
X-Git-Newrev: 2d1d07c662c2b8a751aeb4969d491f8e57f041b9
X-Patchwork-Hint: ignore
Message-Id: <20240728102452.DA9BB8751C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ubus: remove
 obsolete systemd option
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d1d07c662c2b8a751aeb4969d491f8e57f041b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

ENABLE_SYSTEMD option has been removed from ubus by upstream commit:

  96ab0b3032f5 ubusd: remove systemd socket activation support

From a Buildroot perspective, this means that this systemd socket
activation feature no longer exists since Buildroot commit
130be80d34905d3e79ff6b8f8fb31b3c3765eb96 ("ubus: bump version"), as we
bumped ubus from 259450f414d8c9ee41896e8e6d6bc57ec00e2b63 to
34c6e818e431cc53478a0f7c7c1eca07d194d692 in this commit, and the
96ab0b3032f5 ("ubusd: remove systemd socket activation support")
commit is in this range. It was therefore dropped upstream in 2016,
and in Buildroot in 2017.

Signed-off-by: Jan Havran <havran.jan@email.cz>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 60c8807c69be60a8f1c35ed9f992850b009126be)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ubus/ubus.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/ubus/ubus.mk b/package/ubus/ubus.mk
index 1f9891411a..cc2ed81786 100644
--- a/package/ubus/ubus.mk
+++ b/package/ubus/ubus.mk
@@ -25,13 +25,6 @@ else
 UBUS_CONF_OPTS += -DBUILD_LUA=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_SYSTEMD),y)
-UBUS_DEPENDENCIES += systemd
-UBUS_CONF_OPTS += -DENABLE_SYSTEMD=ON
-else
-UBUS_CONF_OPTS += -DENABLE_SYSTEMD=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_UBUS_EXAMPLES),y)
 UBUS_CONF_OPTS += -DBUILD_EXAMPLES=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
