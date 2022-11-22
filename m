Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA416C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC324026C;
	Mon,  5 Dec 2022 12:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EC324026C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PXw_-zjADuJ3; Mon,  5 Dec 2022 12:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 212CE4005E;
	Mon,  5 Dec 2022 12:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 212CE4005E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10F381BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C98AA4167A
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C98AA4167A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mhv8lZpgTnYT for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B81FE416A5
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B81FE416A5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A84BC85BBE; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 23:28:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72fa60dc102679f51b228336ec38f5af78ff7646
X-Git-Newrev: c4fa02ee636420c40cf24412ee59c5f21c673d3e
X-Patchwork-Hint: ignore
Message-Id: <20221205112610.A84BC85BBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-mqtt: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4fa02ee636420c40cf24412ee59c5f21c673d3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in              |  1 +
 package/lua-mqtt/Config.in     | 11 +++++++++++
 package/lua-mqtt/lua-mqtt.hash |  3 +++
 package/lua-mqtt/lua-mqtt.mk   | 11 +++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 6290e103bb..7ad7e2d487 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -722,6 +722,7 @@ menu "Lua libraries/modules"
 	source "package/lua-lyaml/Config.in"
 	source "package/lua-markdown/Config.in"
 	source "package/lua-messagepack/Config.in"
+	source "package/lua-mqtt/Config.in"
 	source "package/lua-msgpack-native/Config.in"
 	source "package/lua-periphery/Config.in"
 	source "package/lua-resty-http/Config.in"
diff --git a/package/lua-mqtt/Config.in b/package/lua-mqtt/Config.in
new file mode 100644
index 0000000000..b713319054
--- /dev/null
+++ b/package/lua-mqtt/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LUA_MQTT
+	bool "lua-mqtt"
+	depends on BR2_PACKAGE_LUA_5_3 || BR2_PACKAGE_LUA_5_4
+	help
+	  client library for MQTT 3.1.1 & 5.
+
+	  https://fperrad.frama.io/lua-mqtt
+
+comment "lua-mqtt needs a Lua >= 5.3"
+	depends on !BR2_PACKAGE_LUA_5_3
+	depends on !BR2_PACKAGE_LUA_5_4
diff --git a/package/lua-mqtt/lua-mqtt.hash b/package/lua-mqtt/lua-mqtt.hash
new file mode 100644
index 0000000000..3636e9e6af
--- /dev/null
+++ b/package/lua-mqtt/lua-mqtt.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  986ec63dd9f0761f9c5231f6e19529138602c289e13da5c71dc1449f5f247152  lua-mqtt-0.1.0-1.src.rock
+sha256  e86d7c8adfabcb7c6515cc6e524bf0a76f7b3a86560a7ac47d7cabae5f8391a2  lua-mqtt-0.1.0/COPYRIGHT
diff --git a/package/lua-mqtt/lua-mqtt.mk b/package/lua-mqtt/lua-mqtt.mk
new file mode 100644
index 0000000000..a2f17d2b2e
--- /dev/null
+++ b/package/lua-mqtt/lua-mqtt.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# lua-mqtt
+#
+################################################################################
+
+LUA_MQTT_VERSION = 0.1.0-1
+LUA_MQTT_LICENSE = MIT
+LUA_MQTT_LICENSE_FILES = $(LUA_MQTT_SUBDIR)/COPYRIGHT
+
+$(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
