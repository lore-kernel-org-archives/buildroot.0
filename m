Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76E7107BCE6
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86B5940E5B;
	Fri, 13 Mar 2026 20:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_hqdGIZ2R-i; Fri, 13 Mar 2026 20:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63F1740E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773434201;
	bh=RqoSd2Y106ZEZ6pey3fveht+wcElZPBa91ccRoxlElo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QY7R2thg1/S12bEuFuCE0kPU8B3q9/fxNPeOHrdQvpss4P+cAYwaeXoncP4hg8N0/
	 hIDaIlPq+20tBRZdY3YLUcCwT0tRj1N/UZSNozfB1FyhndLpCdwL9iLG7M4CE2xjK6
	 oPCgztUP5t8S0x+bmrhQlf0KvnCrYtBlYbvSR2zrihjRlEQ0v1OozU9G7/KUGXvfVj
	 tljLDTzIqkbER5QU4kktW8OWM+HShX1MZGakND/X6pxi984usLcjHjO8RDcAu65lBa
	 ek9dNJ0O7wh0tOKyuNwyuvLGdlaVQGUhY4yMo1/7LUXdjzg7Y1a7vqyXeFBBSs1/NV
	 6byKTWnBxVhVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63F1740E64;
	Fri, 13 Mar 2026 20:36:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3E31787
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA38C405D8
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCywjcmuAS7U for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FF62405E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FF62405E6
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A57BB86F30; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:26:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b3efa8c7e9bcb38f8fec5077c3aac1728b0ddf6
X-Git-Newrev: 174a07ec22d37f0e296f0a7384a1093036205ed5
X-Patchwork-Hint: ignore
Message-Id: <20260313203629.A57BB86F30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: add option to enable
 the $CONTROL/# topics tree
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/174a07ec22d37f0e296f0a7384a1093036205ed5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mosquitto/Config.in    | 7 +++++++
 package/mosquitto/mosquitto.mk | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 068f2386e1..08223bc5db 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -101,6 +101,13 @@ config BR2_PACKAGE_MOSQUITTO_BROKER_SYS
 	  Enable the $SYS/# tree structure, to export broker status as
 	  MQTT topics.
 
+config BR2_PACKAGE_MOSQUITTO_BROKER_CONTROL
+	bool "$CONTROL tree support"
+	default y  # legacy
+	help
+	  Enable the $CONTROL/# tree structure, to control the broker
+	  via messages posted to, or retrieved from, MQTT topics.
+
 config BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD
 	bool "static password file plugin"
 	default y
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 89a90470e1..06de7fc2af 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -94,7 +94,8 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_PLUGIN_ACL_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_ACL),ON,OFF) \
 	-DWITH_PLUGIN_DYNAMIC_SECURITY=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),ON,OFF) \
 	-DINC_BRIDGE_SUPPORT=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_BRIDGE),ON,OFF) \
-	-DWITH_SYS_TREE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_SYS),ON,OFF)
+	-DWITH_SYS_TREE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_SYS),ON,OFF) \
+	-DWITH_CONTROL=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_CONTROL),ON,OFF)
 
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API),y)
 MOSQUITTO_DEPENDENCIES += libmicrohttpd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
