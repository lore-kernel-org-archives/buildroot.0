Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EFF107BCE5
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DA0660DF5;
	Fri, 13 Mar 2026 20:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OquN4hQFhcMv; Fri, 13 Mar 2026 20:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45F6760DF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773434200;
	bh=KrEspl5KSqoXd5dgx5tUjoc7TfWKhSicxXRs7bg3fME=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=G83uL+GqmHPItTNH5rGOfx+RqnOFkJ0TcDonPxjY3kgaLTh0KerVjU+n9epV3maUI
	 kuhzPmTHSR6td3qqUeUkGrYuAjqU3hT3s5p9Cx13KMhm07q5Rr9OP/skcW+Bvh/6ss
	 +/zBvWxw7xC36AoI+OIDnEoq3lQc2qHoqpZ62nS95jkCXGJ2/U63M2RnVSuTuNZCU6
	 QFdJRs6d2HWIaz9s/4RS+0eUb2Zbhbj4Isux+diD9zYrlcue65/BN06LImu+rRqRZB
	 taCR4Eo3u9ZwZzPuO4aAnUUruNP1kWht1f/PgRfBe7MUpNUOnIU4RzQki/oXE68l8d
	 L6XdGSrFjZwEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F6760DF7;
	Fri, 13 Mar 2026 20:36:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE71F1AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4A4260DE4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMTviDu0OVlf for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 634C860DE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 634C860DE7
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98C3186EF1; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:26:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e11bbbcd1958df45e308078cd620ebffff52eea
X-Git-Newrev: 1b3efa8c7e9bcb38f8fec5077c3aac1728b0ddf6
X-Patchwork-Hint: ignore
Message-Id: <20260313203629.98C3186EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: add option to enable
 the $SYS/# topics tree
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b3efa8c7e9bcb38f8fec5077c3aac1728b0ddf6
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
index aa678714b0..068f2386e1 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -94,6 +94,13 @@ config BR2_PACKAGE_MOSQUITTO_BROKER_BRIDGE
 	help
 	  Include bridge support for connecting to other brokers
 
+config BR2_PACKAGE_MOSQUITTO_BROKER_SYS
+	bool "$SYS tree support"
+	default y  # legacy
+	help
+	  Enable the $SYS/# tree structure, to export broker status as
+	  MQTT topics.
+
 config BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD
 	bool "static password file plugin"
 	default y
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 89dab87a53..89a90470e1 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -93,7 +93,8 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_PLUGIN_PASSWORD_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD),ON,OFF) \
 	-DWITH_PLUGIN_ACL_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_ACL),ON,OFF) \
 	-DWITH_PLUGIN_DYNAMIC_SECURITY=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),ON,OFF) \
-	-DINC_BRIDGE_SUPPORT=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_BRIDGE),ON,OFF)
+	-DINC_BRIDGE_SUPPORT=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_BRIDGE),ON,OFF) \
+	-DWITH_SYS_TREE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_SYS),ON,OFF)
 
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API),y)
 MOSQUITTO_DEPENDENCIES += libmicrohttpd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
