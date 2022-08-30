Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85FDECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80D4A60FE7;
	Tue, 30 Aug 2022 16:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80D4A60FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7TAo6J90RxN; Tue, 30 Aug 2022 16:15:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70CC960FE6;
	Tue, 30 Aug 2022 16:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70CC960FE6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DEFC1BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57F07812FE
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57F07812FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4wx463rC9zf for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8F308137A
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F308137A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F14DC88091; Tue, 30 Aug 2022 15:59:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 17:52:52 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: f9f05667b3e89bbd498662ec642bec78819c8b75
X-Git-Newrev: 08ac2f4540d4695d80abb9996e0cc43a8244b57b
X-Patchwork-Hint: ignore
Message-Id: <20220830155957.F14DC88091@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/paho-mqtt-c:
 sample file path without white-space
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

commit: https://git.buildroot.net/buildroot/commit/?id=08ac2f4540d4695d80abb9996e0cc43a8244b57b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
(cherry picked from commit 51eedcf465581e06db3f487e4581bfc2dc45e326)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
