Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D1CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:44:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A2CA61108
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 12:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A2CA61108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D197A608B8;
	Sun, 12 Sep 2021 12:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWjs-TTiN359; Sun, 12 Sep 2021 12:44:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 173F6608FA;
	Sun, 12 Sep 2021 12:44:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF7C1BF47A
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1975540119
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 12:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1bp6h1Db5T8N for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 12:43:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15CBB40267
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:43:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C45288A406; Sun, 12 Sep 2021 12:41:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 14:35:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5eb075d55c038ac26acaaed9781cf4589180539
X-Git-Newrev: c90776302c79e33ac2da7f666291c6d7960a96c3
X-Patchwork-Hint: ignore
Message-Id: <20210912124145.C45288A406@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez-tools: bump to version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c90776302c79e33ac2da7f666291c6d7960a96c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Minor fixes:
- build with gcc 10 (drop patch)
- correct the signal handler registration bt-agent

Other changes:
- remove incorrectly handled error argument from device_* calls
- add UUID for SIMAccess

Signed-off-by: Jan Havran <havran.jan@email.cz>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bluez-tools/0001-fix-gcc-10-compile.patch | 46 -----------------------
 package/bluez-tools/bluez-tools.hash              |  2 +-
 package/bluez-tools/bluez-tools.mk                |  2 +-
 3 files changed, 2 insertions(+), 48 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
