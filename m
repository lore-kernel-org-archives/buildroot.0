Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E08C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 20:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37BE26139B;
	Thu, 25 Apr 2024 20:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQ8FJCe-jobd; Thu, 25 Apr 2024 20:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09521613B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09521613B4;
	Thu, 25 Apr 2024 20:37:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D5671BF388
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 20:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBC8A82F6F
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 20:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4iWIoSIdfuP2 for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 20:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED36482F80
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED36482F80
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 20:37:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC31986161; Thu, 25 Apr 2024 20:37:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 22:36:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1989b1a0ab0c867dfc95cf9e1ce55c19ccd02e31
X-Git-Newrev: 086035d4f953d07467f5982fc0b8a686e20026d6
X-Patchwork-Hint: ignore
Message-Id: <20240425203736.CC31986161@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-mqtt: bump to version 0.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=086035d4f953d07467f5982fc0b8a686e20026d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff COPYRIGHT:
    -Copyright (C) 2022-2023 Francois Perrad.
    +Copyright (C) 2022-2024 Francois Perrad.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-mqtt/lua-mqtt.hash | 4 ++--
 package/lua-mqtt/lua-mqtt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-mqtt/lua-mqtt.hash b/package/lua-mqtt/lua-mqtt.hash
index fecd4dbbdd..287a583f2c 100644
--- a/package/lua-mqtt/lua-mqtt.hash
+++ b/package/lua-mqtt/lua-mqtt.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  0444119ab5a1230e38e35f3948db19e8dc6310991b419ca75e6660588f2d95f7  lua-mqtt-0.3.1-1.src.rock
-sha256  c8d12c868b979f5b9592eec503fc3de54e9feb92163f3cfc50a141ee2bcccc25  lua-mqtt-0.3.1/COPYRIGHT
+sha256  fe2dba2c6d99c0099f5dceeb8063e06348c3fc492e8d2f8f35d49197e8a36985  lua-mqtt-0.3.2-1.src.rock
+sha256  3db678c27de7ac8811e5e926b1d67923a07c2abe85a28387e6af96d0f654d0b5  lua-mqtt-0.3.2/COPYRIGHT
diff --git a/package/lua-mqtt/lua-mqtt.mk b/package/lua-mqtt/lua-mqtt.mk
index a000ffdb16..03d28853b9 100644
--- a/package/lua-mqtt/lua-mqtt.mk
+++ b/package/lua-mqtt/lua-mqtt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MQTT_VERSION = 0.3.1-1
+LUA_MQTT_VERSION = 0.3.2-1
 LUA_MQTT_LICENSE = MIT
 LUA_MQTT_LICENSE_FILES = $(LUA_MQTT_SUBDIR)/COPYRIGHT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
