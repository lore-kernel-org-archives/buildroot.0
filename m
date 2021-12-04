Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F61C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53897400E9;
	Sat,  4 Dec 2021 21:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bslqxWH1RoFr; Sat,  4 Dec 2021 21:24:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FBC940156;
	Sat,  4 Dec 2021 21:24:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B07D1BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74A8C4034D
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGOYbG6eielk for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:24:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9C5C40302
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:24:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 92CD193519; Sat,  4 Dec 2021 21:19:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:11:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6861933d22006fbe8c961a41506beac826881f33
X-Git-Newrev: e27b38bf3c429144bbc1e0155654dbc157fe86c2
X-Patchwork-Hint: ignore
Message-Id: <20211204211942.92CD193519@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-tinycss2: new
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e27b38bf3c429144bbc1e0155654dbc157fe86c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-tinycss2/Config.in            |  6 ++++++
 package/python-tinycss2/python-tinycss2.hash |  5 +++++
 package/python-tinycss2/python-tinycss2.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6f812eb564..a1565f375a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1267,6 +1267,7 @@ F:	package/python-pycares/
 F:	package/python-snappy/
 F:	package/python-sockjs/
 F:	package/python-terminaltables/
+F:	package/python-tinycss2/
 F:	package/python-yarl/
 
 N:	James Knight <james.knight@collins.com>
diff --git a/package/Config.in b/package/Config.in
index 311004db2c..de03cd7375 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1240,6 +1240,7 @@ menu "External python modules"
 	source "package/python-terminaltables/Config.in"
 	source "package/python-texttable/Config.in"
 	source "package/python-thrift/Config.in"
+	source "package/python-tinycss2/Config.in"
 	source "package/python-tinyrpc/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
diff --git a/package/python-tinycss2/Config.in b/package/python-tinycss2/Config.in
new file mode 100644
index 0000000000..e6c992b8c5
--- /dev/null
+++ b/package/python-tinycss2/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TINYCSS2
+	bool "python-tinycss2"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
+	help
+	  A tiny CSS parser.
diff --git a/package/python-tinycss2/python-tinycss2.hash b/package/python-tinycss2/python-tinycss2.hash
new file mode 100644
index 0000000000..eeb3754752
--- /dev/null
+++ b/package/python-tinycss2/python-tinycss2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tinycss2/json
+md5  7caf513c4e87fc2449dcfbf407a8416f  tinycss2-1.1.0.tar.gz
+sha256  fbdcac3044d60eb85fdb2aa840ece43cf7dbe798e373e6ee0be545d4d134e18a  tinycss2-1.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  6b94acee20ec9f2709333134f3ba70322535fb420af0ce8c1455d9cbe297f1d5  LICENSE
diff --git a/package/python-tinycss2/python-tinycss2.mk b/package/python-tinycss2/python-tinycss2.mk
new file mode 100644
index 0000000000..4bf5b97766
--- /dev/null
+++ b/package/python-tinycss2/python-tinycss2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tinycss2
+#
+################################################################################
+
+PYTHON_TINYCSS2_VERSION = 1.1.0
+PYTHON_TINYCSS2_SOURCE = tinycss2-$(PYTHON_TINYCSS2_VERSION).tar.gz
+PYTHON_TINYCSS2_SITE = https://files.pythonhosted.org/packages/ce/d3/ece7a98d5826bd134e269a3a3030153d30482194fca71d95a3041812aab8
+PYTHON_TINYCSS2_SETUP_TYPE = distutils
+PYTHON_TINYCSS2_LICENSE = BSD-3-Clause
+PYTHON_TINYCSS2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
