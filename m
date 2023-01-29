Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58C8C61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71E2960C2E;
	Sun, 29 Jan 2023 16:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71E2960C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zHeag0v7IFx7; Sun, 29 Jan 2023 16:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8478A60BEF;
	Sun, 29 Jan 2023 16:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8478A60BEF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AEED1BF476
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C7D54155E
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C7D54155E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yM4gHf1zwi5Q for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:42:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E423840993
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E423840993
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D29F788167; Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:41:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4d75ef7c663e97baa98956fd30770b9b23b311a
X-Git-Newrev: 3eb3116bfe8ef503acd7756f5071701132d430b1
X-Patchwork-Hint: ignore
Message-Id: <20230129164233.D29F788167@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-trio-websocket: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=3eb3116bfe8ef503acd7756f5071701132d430b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                               |  1 +
 package/Config.in                                        |  1 +
 package/python-trio-websocket/Config.in                  |  9 +++++++++
 package/python-trio-websocket/python-trio-websocket.hash |  3 +++
 package/python-trio-websocket/python-trio-websocket.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bb56753418..7e9e4df8f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1403,6 +1403,7 @@ F:	package/python-terminaltables/
 F:	package/python-tinycss2/
 F:	package/python-tomli/
 F:	package/python-trio/
+F:	package/python-trio-websocket/
 F:	package/python-typeguard/
 F:	package/python-typing-inspect/
 F:	package/python-uhid/
diff --git a/package/Config.in b/package/Config.in
index 2cb785c128..46679095b3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1307,6 +1307,7 @@ menu "External python modules"
 	source "package/python-traitlets/Config.in"
 	source "package/python-treq/Config.in"
 	source "package/python-trio/Config.in"
+	source "package/python-trio-websocket/Config.in"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
 	source "package/python-txdbus/Config.in"
diff --git a/package/python-trio-websocket/Config.in b/package/python-trio-websocket/Config.in
new file mode 100644
index 0000000000..7d35fd0296
--- /dev/null
+++ b/package/python-trio-websocket/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_TRIO_WEBSOCKET
+	bool "python-trio-websocket"
+	select BR2_PACKAGE_PYTHON_ASYNC_GENERATOR # runtime
+	select BR2_PACKAGE_PYTHON_TRIO # runtime
+	select BR2_PACKAGE_PYTHON_WSPROTO # runtime
+	help
+	  WebSocket library for Trio.
+
+	  https://github.com/HyperionGray/trio-websocket
diff --git a/package/python-trio-websocket/python-trio-websocket.hash b/package/python-trio-websocket/python-trio-websocket.hash
new file mode 100644
index 0000000000..3e6e832d90
--- /dev/null
+++ b/package/python-trio-websocket/python-trio-websocket.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/trio-websocket/json
+md5  37b141910bdafa3c9b6731aa16646acc  trio-websocket-0.9.2.tar.gz
+sha256  a3d34de8fac26023eee701ed1e7bf4da9a8326b61a62934ec9e53b64970fd8fe  trio-websocket-0.9.2.tar.gz
diff --git a/package/python-trio-websocket/python-trio-websocket.mk b/package/python-trio-websocket/python-trio-websocket.mk
new file mode 100644
index 0000000000..4522b87c9c
--- /dev/null
+++ b/package/python-trio-websocket/python-trio-websocket.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-trio-websocket
+#
+################################################################################
+
+PYTHON_TRIO_WEBSOCKET_VERSION = 0.9.2
+PYTHON_TRIO_WEBSOCKET_SOURCE = trio-websocket-$(PYTHON_TRIO_WEBSOCKET_VERSION).tar.gz
+PYTHON_TRIO_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/75/91/44a0a016025794ba9fef530a6fbe59987153e2cbea7e11fe2f3d8c618740
+PYTHON_TRIO_WEBSOCKET_SETUP_TYPE = setuptools
+PYTHON_TRIO_WEBSOCKET_LICENSE = MIT
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
