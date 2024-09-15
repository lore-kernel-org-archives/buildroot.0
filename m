Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31193C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2DC181E5F;
	Sun, 15 Sep 2024 21:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6AFNWDh7w5R; Sun, 15 Sep 2024 21:40:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C427484806
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C427484806;
	Sun, 15 Sep 2024 21:40:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B53071BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6225260A61
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zdq9yWG_9Znw for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FDE360878
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FDE360878
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AC44835CD; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b779eb980c5bc47e725ccfd404b43ffd59d9e7a
X-Git-Newrev: e15ee604ca308068eca4c9541e8fbfea528f0db4
X-Patchwork-Hint: ignore
Message-Id: <20240915213639.5AC44835CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-simple-websocket: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e15ee604ca308068eca4c9541e8fbfea528f0db4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                          |  1 +
 package/python-simple-websocket/Config.in                  |  7 +++++++
 .../python-simple-websocket/python-simple-websocket.hash   |  5 +++++
 package/python-simple-websocket/python-simple-websocket.mk | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 269a8cae6f..38944bdd4f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1372,6 +1372,7 @@ menu "External python modules"
 	source "package/python-setuptools/Config.in"
 	source "package/python-sh/Config.in"
 	source "package/python-shutilwhich/Config.in"
+	source "package/python-simple-websocket/Config.in"
 	source "package/python-simpleaudio/Config.in"
 	source "package/python-simplegeneric/Config.in"
 	source "package/python-simplejson/Config.in"
diff --git a/package/python-simple-websocket/Config.in b/package/python-simple-websocket/Config.in
new file mode 100644
index 0000000000..187d20a3a3
--- /dev/null
+++ b/package/python-simple-websocket/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SIMPLE_WEBSOCKET
+	bool "python-simple-websocket"
+	select BR2_PACKAGE_PYTHON_WSPROTO # runtime
+	help
+	  Simple WebSocket server and client for Python.
+
+	  https://github.com/miguelgrinberg/simple-websocket
diff --git a/package/python-simple-websocket/python-simple-websocket.hash b/package/python-simple-websocket/python-simple-websocket.hash
new file mode 100644
index 0000000000..f6cf8457dc
--- /dev/null
+++ b/package/python-simple-websocket/python-simple-websocket.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/simple-websocket/json
+md5  e1dd8c3da6994555289611586c326dfe  simple-websocket-1.0.0.tar.gz
+sha256  17d2c72f4a2bd85174a97e3e4c88b01c40c3f81b7b648b0cc3ce1305968928c8  simple-websocket-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  4b8abadcc5e3dd29c71905b84952945699f0a7ba41e6af99eaba46faabe95bb7  LICENSE
diff --git a/package/python-simple-websocket/python-simple-websocket.mk b/package/python-simple-websocket/python-simple-websocket.mk
new file mode 100644
index 0000000000..1fdf7f8763
--- /dev/null
+++ b/package/python-simple-websocket/python-simple-websocket.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-simple-websocket
+#
+################################################################################
+
+PYTHON_SIMPLE_WEBSOCKET_VERSION = 1.0.0
+PYTHON_SIMPLE_WEBSOCKET_SOURCE = simple-websocket-$(PYTHON_SIMPLE_WEBSOCKET_VERSION).tar.gz
+PYTHON_SIMPLE_WEBSOCKET_SITE = https://files.pythonhosted.org/packages/d3/82/3cf87d317911864a2f2a8daf1779fc7f82d5d55e6a8aaa0315f8209047a7
+PYTHON_SIMPLE_WEBSOCKET_SETUP_TYPE = setuptools
+PYTHON_SIMPLE_WEBSOCKET_LICENSE = MIT
+PYTHON_SIMPLE_WEBSOCKET_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
