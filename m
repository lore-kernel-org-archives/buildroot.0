Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA032107BCE5
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D56240D3B;
	Fri, 13 Mar 2026 20:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvXvlHePQaAu; Fri, 13 Mar 2026 20:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CA3940D4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773434191;
	bh=EyHO1yrsWJ9h/PTSxVN2UD3lowRmjVPu3ndwy0M0XCM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QgPebFMJome9UMzbT54dtITAGgDM38hrPPEbuli+/tfAw2wrG9pFaupGyoG7ExBHC
	 b5Fr5CfHlauEpfRzILDfgvy1GBemE8WMXuCHj62tcZSbS1ex9zWyA/pVIf4Jtyk5Yc
	 r5C2dIxyxIeVF66hOHRdb2n6bn8hc8Wj3Y6a8LM5WIgh2vBNkEj3KzgJc9XTkG/fQo
	 Bi9A8729mN3BFjsKKQpKXxAzaPPVke3MPEEwzFjcbzvyBivhGTg+7LZzbm3IyP9xr0
	 vPAZl5hNwdHsr4Es37UWizxMNHbH1N0fV3WEba1e6ZklXQ+8TZzwxitfccfB3+MeCO
	 p3X1PT45iy2rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CA3940D4C;
	Fri, 13 Mar 2026 20:36:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D10DF201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C260760DE8
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPtr38tQKwTz for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1593F60DE4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1593F60DE4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BE6C86EF1; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:22:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 583a02e398888a9fb39b9b20cf98f1edd646584c
X-Git-Newrev: 41dec067fefe590b535af93767c907352025e6e9
X-Patchwork-Hint: ignore
Message-Id: <20260313203629.3BE6C86EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] pakcage.mosquitto: add option to install
 CLI tools
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/41dec067fefe590b535af93767c907352025e6e9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

mosquitto_pub/sub/rr can be handy to test a broker from the command
line, but they can get superfluous when only the broker is required
on the target.

Add an option to enable or disable them. Make that new option enabled
by default to keep backward compatibility with previous (def)config
files.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mosquitto/Config.in    | 9 +++++++++
 package/mosquitto/mosquitto.mk | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index cb1c037daa..417745873b 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -24,6 +24,15 @@ config BR2_PACKAGE_MOSQUITTO
 
 if BR2_PACKAGE_MOSQUITTO
 
+config BR2_PACKAGE_MOSQUITTO_CLIENTS
+	bool "install clients"
+	default y  # Backward compatibility
+	help
+	  Install CLI tools to publish/subscribe to the broker:
+	    mosquitto_pub
+	    mosquitto_sub
+	    mosquitto_rr
+
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 6e9ad434ba..62934966ca 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -19,7 +19,6 @@ MOSQUITTO_CONF_OPTS = \
 	-DWITH_TESTS=OFF \
 	-DWITH_STATIC_LIBRARIES=OFF \
 	-DWITH_BUNDLED_DEPS=ON \
-	-DWITH_CLIENTS=ON \
 	-DWITH_HTTP_API=OFF \
 	-DWITH_CTRL_SHELL=OFF
 
@@ -70,6 +69,12 @@ else
 MOSQUITTO_CONF_OPTS += -DWITH_LIB_CPP=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_CLIENTS),y)
+MOSQUITTO_CONF_OPTS += -DWITH_CLIENTS=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_CLIENTS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
 
 MOSQUITTO_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
