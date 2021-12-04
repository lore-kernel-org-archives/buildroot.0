Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78747C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 384F78319F;
	Sat,  4 Dec 2021 21:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZI4tJkTL8iIR; Sat,  4 Dec 2021 21:48:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81D8E83139;
	Sat,  4 Dec 2021 21:48:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC7311BF95C
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB8B58319F
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSDx6VtBsNqH for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:48:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8CFC83147
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:48:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BE85793570; Sat,  4 Dec 2021 21:43:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:47:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ee80fbcc791c47a3b722f59eccea5dfec1d0c8c1
X-Git-Newrev: b33e39e3ea5078cc80d9658e8af63049189bd475
X-Patchwork-Hint: ignore
Message-Id: <20211204214318.BE85793570@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-weasyprint: new
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

commit: https://git.buildroot.net/buildroot/commit/?id=b33e39e3ea5078cc80d9658e8af63049189bd475
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-weasyprint/Config.in              | 17 +++++++++++++++++
 package/python-weasyprint/python-weasyprint.hash |  5 +++++
 package/python-weasyprint/python-weasyprint.mk   | 14 ++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6fc6c6286f..fd3ee964b2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1272,6 +1272,7 @@ F:	package/python-snappy/
 F:	package/python-sockjs/
 F:	package/python-terminaltables/
 F:	package/python-tinycss2/
+F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
 
diff --git a/package/Config.in b/package/Config.in
index 871295e66f..006d3cf284 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1271,6 +1271,7 @@ menu "External python modules"
 	source "package/python-visitor/Config.in"
 	source "package/python-watchdog/Config.in"
 	source "package/python-wcwidth/Config.in"
+	source "package/python-weasyprint/Config.in"
 	source "package/python-web2py/Config.in"
 	source "package/python-webencodings/Config.in"
 	source "package/python-webob/Config.in"
diff --git a/package/python-weasyprint/Config.in b/package/python-weasyprint/Config.in
new file mode 100644
index 0000000000..de68fe2f5b
--- /dev/null
+++ b/package/python-weasyprint/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_PYTHON_WEASYPRINT
+	bool "python-weasyprint"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_BROTLI # runtime
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
+	select BR2_PACKAGE_PYTHON_FONTTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_HTML5LIB # runtime
+	select BR2_PACKAGE_PYTHON_PILLOW # runtime
+	select BR2_PACKAGE_PYTHON_PYDYF # runtime
+	select BR2_PACKAGE_PYTHON_PYPHEN # runtime
+	select BR2_PACKAGE_PYTHON_TINYCSS2 # runtime
+	select BR2_PACKAGE_PYTHON_ZOPFLI # runtime
+	help
+	  The Awesome Document Factory.
+
+	  https://www.courtbouillon.org/weasyprint
diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
new file mode 100644
index 0000000000..8d231c50ba
--- /dev/null
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/weasyprint/json
+md5  a90fd2d5a581a0e218943af3a8b64a31  weasyprint-53.4.tar.gz
+sha256  10ccb17d55c73096bdf1edd3efe58cb855b07e4c307d9bad4ebc9a3f13ff4580  weasyprint-53.4.tar.gz
+# Locally computed sha256 checksums
+sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
new file mode 100644
index 0000000000..0a944825bb
--- /dev/null
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-weasyprint
+#
+################################################################################
+
+PYTHON_WEASYPRINT_VERSION = 53.4
+PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/72/25/336e274fde0e48cf9979d44667411fbcfa55d323fd7672068807b6de2f89
+PYTHON_WEASYPRINT_SETUP_TYPE = distutils
+PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
+PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
