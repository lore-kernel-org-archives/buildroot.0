Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F694C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6DEB42462;
	Sat, 23 Jul 2022 19:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6DEB42462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0tMZoYm6VecR; Sat, 23 Jul 2022 19:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D88F42465;
	Sat, 23 Jul 2022 19:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D88F42465
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4526F1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C07C94245D
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C07C94245D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1MiyANkQnjvd for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83C294245B
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83C294245B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0ECA084329; Sat, 23 Jul 2022 18:56:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:07:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbc17cc59dfe253a61d646fb592842f16493b50d
X-Git-Newrev: b7d854bf060632e8bcd4fbe3b8ab8074dad472f6
X-Patchwork-Hint: ignore
Message-Id: <20220723185616.0ECA084329@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typeguard: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7d854bf060632e8bcd4fbe3b8ab8074dad472f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-typeguard/Config.in             |  6 ++++++
 package/python-typeguard/python-typeguard.hash |  5 +++++
 package/python-typeguard/python-typeguard.mk   | 15 +++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 62053c4b64..55e27edf83 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1359,6 +1359,7 @@ F:	package/python-sockjs/
 F:	package/python-terminaltables/
 F:	package/python-tinycss2/
 F:	package/python-tomli/
+F:	package/python-typeguard/
 F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
diff --git a/package/Config.in b/package/Config.in
index 75a756ba6f..75516dd453 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1269,6 +1269,7 @@ menu "External python modules"
 	source "package/python-txaio/Config.in"
 	source "package/python-txdbus/Config.in"
 	source "package/python-txtorcon/Config.in"
+	source "package/python-typeguard/Config.in"
 	source "package/python-typepy/Config.in"
 	source "package/python-typing-extensions/Config.in"
 	source "package/python-u-msgpack/Config.in"
diff --git a/package/python-typeguard/Config.in b/package/python-typeguard/Config.in
new file mode 100644
index 0000000000..6fd8351570
--- /dev/null
+++ b/package/python-typeguard/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TYPEGUARD
+	bool "python-typeguard"
+	help
+	  Run-time type checker for Python.
+
+	  https://github.com/agronholm/typeguard
diff --git a/package/python-typeguard/python-typeguard.hash b/package/python-typeguard/python-typeguard.hash
new file mode 100644
index 0000000000..76394bcb19
--- /dev/null
+++ b/package/python-typeguard/python-typeguard.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/typeguard/json
+md5  22d49971f62f3baa3525349b1e03723d  typeguard-2.13.3.tar.gz
+sha256  00edaa8da3a133674796cf5ea87d9f4b4c367d77476e185e80251cc13dfbb8c4  typeguard-2.13.3.tar.gz
+# Locally computed sha256 checksums
+sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE
diff --git a/package/python-typeguard/python-typeguard.mk b/package/python-typeguard/python-typeguard.mk
new file mode 100644
index 0000000000..8471f2e4fd
--- /dev/null
+++ b/package/python-typeguard/python-typeguard.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-typeguard
+#
+################################################################################
+
+PYTHON_TYPEGUARD_VERSION = 2.13.3
+PYTHON_TYPEGUARD_SOURCE = typeguard-$(PYTHON_TYPEGUARD_VERSION).tar.gz
+PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/3a/38/c61bfcf62a7b572b5e9363a802ff92559cb427ee963048e1442e3aef7490
+PYTHON_TYPEGUARD_SETUP_TYPE = setuptools
+PYTHON_TYPEGUARD_LICENSE = MIT
+PYTHON_TYPEGUARD_LICENSE_FILES = LICENSE
+PYTHON_TYPEGUARD_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
