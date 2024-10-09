Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9607CEE34A
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 20:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84EFD80BE2;
	Wed,  9 Oct 2024 20:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsPK_cA6gfN3; Wed,  9 Oct 2024 20:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95DB680BE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95DB680BE5;
	Wed,  9 Oct 2024 20:39:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FBB71BF3E1
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 20:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F31896075B
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 20:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2Oggey29P8n for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 20:39:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AF7F60680
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AF7F60680
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 20:39:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1020E841CA; Wed,  9 Oct 2024 20:39:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Oct 2024 22:39:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0fb031d8cd1ee5ad5a1cfd8c868705503dbe114
X-Git-Newrev: c4f22abb934c3ba3de92d468b36d719057755a4f
X-Patchwork-Hint: ignore
Message-Id: <20241009203944.1020E841CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: enable asha/bass
 when building audio plugins
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4f22abb934c3ba3de92d468b36d719057755a4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Symbols from the asha plugin are required when building a2dp
support as part of the audio plugins, so always enable asha
when audio plugins are selected.

Symbols from the bass plugin are required when building bap
support as part of the audio plugins, so always enable bass
when audio plugins are selected.

This issue appeared during an attempt to fix a related issue in
ce4e5fd129b557ac0411d0a0704be43717310d6d.

Fixes:
 - http://autobuild.buildroot.net/results/5a3/5a306356f5f190a14a0a2294a4428544b1a018bb
 - http://autobuild.buildroot.net/results/353/3539c83deaa45a3548bcd488659148c62af3fc73

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Cc: Frank TEO <frank128@ymail.com>
Tested-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bluez5_utils/bluez5_utils.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 13a8ce2f0b..717c10e870 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -28,7 +28,6 @@ BLUEZ5_UTILS_CONF_OPTS = \
 	--disable-lsan \
 	--disable-ubsan \
 	--disable-pie \
-	--disable-asha \
 	--with-dbusconfdir=/etc
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
@@ -68,15 +67,19 @@ endif
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO),y)
 BLUEZ5_UTILS_CONF_OPTS += \
 	--enable-a2dp \
+	--enable-asha \
 	--enable-avrcp \
 	--enable-bap \
+	--enable-bass \
 	--enable-mcp \
 	--enable-vcp
 else
 BLUEZ5_UTILS_CONF_OPTS += \
 	--disable-a2dp \
+	--disable-asha \
 	--disable-avrcp \
 	--disable-bap \
+	--disable-bass \
 	--disable-mcp \
 	--disable-vcp
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
