Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF544C19F29
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 10:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41AFA409C1;
	Wed, 27 Jul 2022 10:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41AFA409C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QACPOPudtA_q; Wed, 27 Jul 2022 10:01:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE8CA40A06;
	Wed, 27 Jul 2022 10:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE8CA40A06
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACFE71C1162
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 872E2403B8
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 10:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 872E2403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2j2ZXEHbTjHh for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 10:01:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B85DD40105
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 10:01:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B85DD40105
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EAE7486562; Wed, 27 Jul 2022 09:47:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 11:56:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e861c85d4501d581bb731fd00d87e5ccae1bbbea
X-Git-Newrev: 51eedcf465581e06db3f487e4581bfc2dc45e326
X-Patchwork-Hint: ignore
Message-Id: <20220727094717.EAE7486562@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/paho-mqtt-c: sample file path
 without white-space
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

commit: https://git.buildroot.net/buildroot/commit/?id=51eedcf465581e06db3f487e4581bfc2dc45e326
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default sample files are installed to share/doc/Eclipse Paho C/.
The white-space can cause problems later down the line.
Therefore the path is changed to the one used by paho-mqtt-c
when configured to build the .deb package, which is share/doc/libpaho-mqtt.

Before:
Install configuration: "Release"
Installing: $(STAGING_DIR)/usr/share/doc/Eclipse Paho C/MQTTAsync_publish.c
Installing: $(STAGING_DIR)/usr/share/doc/Eclipse Paho C/MQTTAsync_publish_time.c
Installing: $(STAGING_DIR)/usr/share/doc/Eclipse Paho C/MQTTAsync_subscribe.c

After:
Install configuration: "Release"
Installing: $(STAGING_DIR)/usr/share/doc/libpaho-mqtt/MQTTAsync_publish.c
Installing: $(STAGING_DIR)/usr/share/doc/libpaho-mqtt/MQTTAsync_publish_time.c
Installing: $(STAGING_DIR)/usr/share/doc/libpaho-mqtt/MQTTAsync_subscribe.c

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/paho-mqtt-c/paho-mqtt-c.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index d6356a7ccc..1b6fc5785c 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -11,6 +11,7 @@ PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
 PAHO_MQTT_C_INSTALL_STAGING = YES
 
 PAHO_MQTT_C_CONF_OPTS = \
+	-DCMAKE_INSTALL_DOCDIR=share/doc/libpaho-mqtt \
 	-DPAHO_ENABLE_TESTING=FALSE \
 	-DPAHO_ENABLE_CPACK=FALSE \
 	-DPAHO_HIGH_PERFORMANCE=TRUE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
