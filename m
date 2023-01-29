Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15161C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4ED560A79;
	Sun, 29 Jan 2023 16:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4ED560A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0c7OKwviRJqm; Sun, 29 Jan 2023 16:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBA2760BD5;
	Sun, 29 Jan 2023 16:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBA2760BD5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AE091BF476
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E953A40E47
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E953A40E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQlaGzVHvb8y for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:42:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBCB14098C
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBCB14098C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C60B988166; Sun, 29 Jan 2023 16:42:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:41:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c09481f7f0419e8a69a2813052bc56895a598353
X-Git-Newrev: c4d75ef7c663e97baa98956fd30770b9b23b311a
X-Patchwork-Hint: ignore
Message-Id: <20230129164233.C60B988166@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wsproto: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c4d75ef7c663e97baa98956fd30770b9b23b311a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-wsproto/Config.in           |  7 +++++++
 package/python-wsproto/python-wsproto.hash |  5 +++++
 package/python-wsproto/python-wsproto.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9fdc66f60b..bb56753418 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1407,6 +1407,7 @@ F:	package/python-typeguard/
 F:	package/python-typing-inspect/
 F:	package/python-uhid/
 F:	package/python-weasyprint/
+F:	package/python-wsproto/
 F:	package/python-yarl/
 F:	package/python-zopfli/
 F:	package/rtl8192eu/
diff --git a/package/Config.in b/package/Config.in
index aa6bb7bce3..2cb785c128 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1340,6 +1340,7 @@ menu "External python modules"
 	source "package/python-wrapt/Config.in"
 	source "package/python-ws4py/Config.in"
 	source "package/python-wsaccel/Config.in"
+	source "package/python-wsproto/Config.in"
 	source "package/python-wtforms/Config.in"
 	source "package/python-xlib/Config.in"
 	source "package/python-xlrd/Config.in"
diff --git a/package/python-wsproto/Config.in b/package/python-wsproto/Config.in
new file mode 100644
index 0000000000..0610348b8d
--- /dev/null
+++ b/package/python-wsproto/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_WSPROTO
+	bool "python-wsproto"
+	select BR2_PACKAGE_PYTHON_H11 # runtime
+	help
+	  WebSockets state-machine based protocol implementation.
+
+	  https://github.com/python-hyper/wsproto/
diff --git a/package/python-wsproto/python-wsproto.hash b/package/python-wsproto/python-wsproto.hash
new file mode 100644
index 0000000000..4eb3195785
--- /dev/null
+++ b/package/python-wsproto/python-wsproto.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/wsproto/json
+md5  f64973434117e23d2079460ed64b05c3  wsproto-1.2.0.tar.gz
+sha256  ad565f26ecb92588a3e43bc3d96164de84cd9902482b130d0ddbaa9664a85065  wsproto-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c0329a8dbf3437b095f7f5cf4257d6bb855e07120cae8786586073ff7a699959  LICENSE
diff --git a/package/python-wsproto/python-wsproto.mk b/package/python-wsproto/python-wsproto.mk
new file mode 100644
index 0000000000..629f4431b4
--- /dev/null
+++ b/package/python-wsproto/python-wsproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-wsproto
+#
+################################################################################
+
+PYTHON_WSPROTO_VERSION = 1.2.0
+PYTHON_WSPROTO_SOURCE = wsproto-$(PYTHON_WSPROTO_VERSION).tar.gz
+PYTHON_WSPROTO_SITE = https://files.pythonhosted.org/packages/c9/4a/44d3c295350d776427904d73c189e10aeae66d7f555bb2feee16d1e4ba5a
+PYTHON_WSPROTO_SETUP_TYPE = setuptools
+PYTHON_WSPROTO_LICENSE = MIT
+PYTHON_WSPROTO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
