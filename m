Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDD7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 20:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7F1383F5E;
	Wed, 20 Jul 2022 20:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7F1383F5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54NIpVOdwpUP; Wed, 20 Jul 2022 20:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B295A82423;
	Wed, 20 Jul 2022 20:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B295A82423
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AAE91C115D
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F1E241042
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F1E241042
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aWTl8tKcRFv3 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 20:56:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5896F4103C
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 20:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5896F4103C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8BFF684079; Wed, 20 Jul 2022 20:42:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 22:42:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35befff3be8d8d03d9eb52d24a8998109cf4c3b7
X-Git-Newrev: 463996d052d51028f719461f2b01ec69203ddf5d
X-Patchwork-Hint: ignore
Message-Id: <20220720204235.8BFF684079@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open62541: more options
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

commit: https://git.buildroot.net/buildroot/commit/?id=463996d052d51028f719461f2b01ec69203ddf5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/open62541/Config.in    | 12 ++++++++++++
 package/open62541/open62541.mk | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/open62541/Config.in b/package/open62541/Config.in
index 220fb3dfa6..6045a5954d 100644
--- a/package/open62541/Config.in
+++ b/package/open62541/Config.in
@@ -39,8 +39,20 @@ config BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL
 
 endchoice
 
+config BR2_PACKAGE_OPEN62541_HISTORIZING
+	bool "historizing"
+	help
+	  Enable basic support for historical access (client and server)
+
+config BR2_PACKAGE_OPEN62541_DISCOVERY
+	bool "discovery"
+	help
+	  Enable Discovery Service (LDS)
+
 config BR2_PACKAGE_OPEN62541_JSON_ENCODING
 	bool "json encoding"
+	help
+	  Enable JSON encoding
 
 config BR2_PACKAGE_OPEN62541_PUBSUB
 	bool "publish/subscribe"
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 1958befae5..00e7236c0e 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -31,6 +31,18 @@ else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_FULL),y)
 OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=FULL
 endif
 
+ifeq ($(BR2_PACKAGE_OPEN62541_HISTORIZING),y)
+OPEN62541_CONF_OPTS += -DUA_ENABLE_HISTORIZING=ON
+else
+OPEN62541_CONF_OPTS += -DUA_ENABLE_HISTORIZING=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPEN62541_DISCOVERY),y)
+OPEN62541_CONF_OPTS += -DUA_ENABLE_DISCOVERY=ON
+else
+OPEN62541_CONF_OPTS += -DUA_ENABLE_DISCOVERY=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPEN62541_JSON_ENCODING),y)
 OPEN62541_CONF_OPTS += -DUA_ENABLE_JSON_ENCODING=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
