Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71386C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 20:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 067D0418DD;
	Wed, 20 Jul 2022 20:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 067D0418DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUir06GOB4r2; Wed, 20 Jul 2022 20:56:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9801418D4;
	Wed, 20 Jul 2022 20:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9801418D4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6956F1C1135
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BEC741B45
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BEC741B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOkkGsJvL0LB for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 20:56:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B74E418CB
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 20:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B74E418CB
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 996D68407C; Wed, 20 Jul 2022 20:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 22:45:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 463996d052d51028f719461f2b01ec69203ddf5d
X-Git-Newrev: f29aecc64de0c42359daaf21bcbe337ffa383222
X-Patchwork-Hint: ignore
Message-Id: <20220720204235.996D68407C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open62541: more PubSub options
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

commit: https://git.buildroot.net/buildroot/commit/?id=f29aecc64de0c42359daaf21bcbe337ffa383222
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/open62541/Config.in    | 14 ++++++++++++++
 package/open62541/open62541.mk | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/package/open62541/Config.in b/package/open62541/Config.in
index 6045a5954d..3f5eb78d52 100644
--- a/package/open62541/Config.in
+++ b/package/open62541/Config.in
@@ -78,6 +78,20 @@ config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL
 	  Enable the information model representation of the PubSub
 	  configuration.
 
+if BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL
+
+config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL_METHODS
+	bool "publish/subscribe information model methods"
+	help
+	  Enable PubSub informationmodel methods
+
+endif
+
+config BR2_PACKAGE_OPEN62541_PUBSUB_ETH_UADP
+	bool "publish/subscribe UADP"
+	help
+	  Enable publish/subscribe UADP over Ethernet
+
 endif # BR2_PACKAGE_OPEN62541_PUBSUB
 
 endif
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 00e7236c0e..9757aa18cb 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -67,6 +67,18 @@ else
 OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL_METHODS),y)
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=ON
+else
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_ETH_UADP),y)
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_ETH_UADP=ON
+else
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_ETH_UADP=OFF
+endif
+
 # Remove unneeded files
 define OPEN62541_REMOVE_UNNEEDED_FILES
 	$(RM) -r $(TARGET_DIR)/usr/share/open62541
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
