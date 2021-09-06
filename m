Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76B1C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:21:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1790D60F13
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 15:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1790D60F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=email.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D61F8400CF;
	Mon,  6 Sep 2021 15:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6q9nbH6pvoV; Mon,  6 Sep 2021 15:21:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA1274015C;
	Mon,  6 Sep 2021 15:21:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B88FB1BF3E0
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5296404BB
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 15:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=email.cz
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JsnTZgASwTxw for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 15:21:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mxd1.seznam.cz (mxd1.seznam.cz [IPv6:2a02:598:a::78:210])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C11FF4049B
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 15:21:44 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc20a.ko.seznam.cz (email-smtpc20a.ko.seznam.cz [10.53.18.24])
 id 193003f799d7696a1b443d99; Mon, 06 Sep 2021 17:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=beta;
 t=1630941702; bh=V4f3mJPft4XV8wQHsGFtYre+3PqRXD+xXz3O2Rl8bsM=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Disposition:Content-Transfer-Encoding;
 b=SK+EaIrRHzoYN3xbngKqKl8NJ5uxH6AISGfcFeuiYuUwH49HDllCXwFZMpu8KoLgT
 vMIL22wWE+B44EEdJDnDWoCSRlu0RyAnp/IQ/JWqQN07HNR9NTr4BTtVbqT3d3FmoJ
 hTC6ytYIrgmn+wS6+xnmG5Hiyj8m41DQpoPXvI34=
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by email-relay7.ko.seznam.cz (Seznam SMTPD 1.3.125) with ESMTP;
 Mon, 06 Sep 2021 17:21:40 +0200 (CEST)  
Date: Mon, 6 Sep 2021 17:21:34 +0200
From: Jan Havran <havran.jan@email.cz>
To: buildroot@buildroot.org
Message-ID: <YTYx/iGrNt8WsbwS@arch-zen.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH 1/1] package/bluez-tools: bump to version
 f65321736475429316f07ee94ec0deac8e46ec4a
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Minor fixes:
- build with gcc 10 (drop patch)
- correct the signal handler registration bt-agent

Other changes:
- remove incorrectly handled error argument from device_* calls
- add UUID for SIMAccess

Signed-off-by: Jan Havran <havran.jan@email.cz>
---
 .../bluez-tools/0001-fix-gcc-10-compile.patch | 46 -------------------
 package/bluez-tools/bluez-tools.hash          |  2 +-
 package/bluez-tools/bluez-tools.mk            |  2 +-
 3 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 package/bluez-tools/0001-fix-gcc-10-compile.patch

diff --git a/package/bluez-tools/0001-fix-gcc-10-compile.patch b/package/bluez-tools/0001-fix-gcc-10-compile.patch
deleted file mode 100644
index 028c2db69d..0000000000
--- a/package/bluez-tools/0001-fix-gcc-10-compile.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 687105d611b38961f390f0a328f9cfa3b93aeb18 Mon Sep 17 00:00:00 2001
-From: Leigh Scott <leigh123linux@gmail.com>
-Date: Tue, 28 Jan 2020 22:46:37 +0000
-Subject: [PATCH] fix gcc-10 compile
-
-[Retrieved from:
-https://github.com/khvzak/bluez-tools/pull/34/commits/687105d611b38961f390f0a328f9cfa3b93aeb18]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/lib/agent-helper.c | 2 ++
- src/lib/agent-helper.h | 4 ++--
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/lib/agent-helper.c b/src/lib/agent-helper.c
-index bf50bcc..2b94100 100644
---- a/src/lib/agent-helper.c
-+++ b/src/lib/agent-helper.c
-@@ -33,6 +33,8 @@
- 
- #include "agent-helper.h"
- 
-+gboolean agent_need_unregister;
-+
- static const gchar *_bt_agent_introspect_xml = "<node name=\"/org/blueztools\">\n\t<interface name=\"org.bluez.Agent1\">\n\t\t<method name=\"Release\">\n\t\t</method>\n\t\t<method name=\"RequestPinCode\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"pincode\" direction=\"out\" type=\"s\"/>\n\t\t</method>\n\t\t<method name=\"DisplayPinCode\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"pincode\" direction=\"in\" type=\"s\"/>\n\t\t</method>\n\t\t<method name=\"RequestPasskey\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"passkey\" direction=\"out\" type=\"u\"/>\n\t\t</method>\n\t\t<method name=\"DisplayPasskey\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"passkey\" direction=\"in\" type=\"u\"/>\n\t\t\t<arg name=\"entered\" direction=\"in\" type=\"q\"/>\n\t\t</method>\n\t\t<method name=\"RequestConfirmation\">\n\t\t\t<arg name=\"device\" direction=\"in\" 
 type=\"o\"/>\n\t\t\t<arg name=\"passkey\" direction=\"in\" type=\"u\"/>\n\t\t</method>\n\t\t<method name=\"RequestAuthorization\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t</method>\n\t\t<method name=\"AuthorizeService\">\n\t\t\t<arg name=\"device\" direction=\"in\" type=\"o\"/>\n\t\t\t<arg name=\"uuid\" direction=\"in\" type=\"s\"/>\n\t\t</method>\n\t\t<method name=\"Cancel\">\n\t\t</method>\n\t</interface>\n</node>\n";
- static guint _bt_agent_registration_id = 0;
- static GHashTable *_pin_hash_table = NULL;
-diff --git a/src/lib/agent-helper.h b/src/lib/agent-helper.h
-index 8e1cc85..9a952c4 100644
---- a/src/lib/agent-helper.h
-+++ b/src/lib/agent-helper.h
-@@ -35,7 +35,7 @@ extern "C" {
- #define AGENT_DBUS_INTERFACE "org.bluez.Agent1"
- #define AGENT_PATH "/org/blueztools"
- 
--gboolean agent_need_unregister;
-+extern gboolean agent_need_unregister;
- 
- void register_agent_callbacks(gboolean interactive_console, GHashTable *pin_dictonary, gpointer main_loop_object, GError **error);
- void unregister_agent_callbacks(GError **error);
-@@ -44,4 +44,4 @@ void unregister_agent_callbacks(GError **error);
- }
- #endif
- 
--#endif /* __AGENT_HELPER_H */
-\ No newline at end of file
-+#endif /* __AGENT_HELPER_H */
diff --git a/package/bluez-tools/bluez-tools.hash b/package/bluez-tools/bluez-tools.hash
index 808e5c6061..f013f195cb 100644
--- a/package/bluez-tools/bluez-tools.hash
+++ b/package/bluez-tools/bluez-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  62ca98af63d2ae142dbc77995c6bd4c259eaba4a5832daa33ae9e3d585b9205f  bluez-tools-97efd293491ad7ec96a655665339908f2478b3d1.tar.gz
+sha256  dd5acf9e501514f4ad1136af966d2723f3270e0e2fffd6d29da93fa76c9fafa3  bluez-tools-f65321736475429316f07ee94ec0deac8e46ec4a.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/bluez-tools/bluez-tools.mk b/package/bluez-tools/bluez-tools.mk
index c58701981a..007235958b 100644
--- a/package/bluez-tools/bluez-tools.mk
+++ b/package/bluez-tools/bluez-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ_TOOLS_VERSION = 97efd293491ad7ec96a655665339908f2478b3d1
+BLUEZ_TOOLS_VERSION = f65321736475429316f07ee94ec0deac8e46ec4a
 BLUEZ_TOOLS_SITE = $(call github,khvzak,bluez-tools,$(BLUEZ_TOOLS_VERSION))
 
 # sources fetched from github, no configure script)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
