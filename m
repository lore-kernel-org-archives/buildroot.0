Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F93C3DA4B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 19:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50CB4611D8;
	Thu, 11 Jul 2024 19:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCVcGIU5O8gY; Thu, 11 Jul 2024 19:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 711F060EC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 711F060EC7;
	Thu, 11 Jul 2024 19:24:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 676BB1BF479
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55383606C7
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XhCvHghMxbb3 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 19:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98AC460664
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98AC460664
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 19:24:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 837C184F5B; Thu, 11 Jul 2024 19:24:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 21:23:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b57f48e131e94a2fafc31e3ca6cb3c11553a5930
X-Git-Newrev: 60c8807c69be60a8f1c35ed9f992850b009126be
X-Patchwork-Hint: ignore
Message-Id: <20240711192410.837C184F5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ubus: remove obsolete systemd
 option
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60c8807c69be60a8f1c35ed9f992850b009126be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
