Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB22C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0969040219;
	Sat,  4 Dec 2021 21:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R7hsHd5KNZar; Sat,  4 Dec 2021 21:25:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D24D840400;
	Sat,  4 Dec 2021 21:25:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE0181BF95C
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABAB940302
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:24:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFVqHqlh_9_2 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:24:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C888C40306
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:24:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A1D649351A; Sat,  4 Dec 2021 21:19:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:11:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e27b38bf3c429144bbc1e0155654dbc157fe86c2
X-Git-Newrev: 3e7eb3ce3d1b3338d5b7d105be688485b9a6aa2d
X-Patchwork-Hint: ignore
Message-Id: <20211204211942.A1D649351A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-cssselect2: new
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e7eb3ce3d1b3338d5b7d105be688485b9a6aa2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/python-cssselect2/Config.in              |  9 +++++++++
 package/python-cssselect2/python-cssselect2.hash |  5 +++++
 package/python-cssselect2/python-cssselect2.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a1565f375a..19a2b0986f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1257,6 +1257,7 @@ F:	package/python-brotli/
 F:	package/python-cbor2/
 F:	package/python-cchardet/
 F:	package/python-charset-normalizer/
+F:	package/python-cssselect2/
 F:	package/python-flatbuffers/
 F:	package/python-frozenlist/
 F:	package/python-greenlet/
diff --git a/package/Config.in b/package/Config.in
index de03cd7375..ed17bd3b5d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -970,6 +970,7 @@ menu "External python modules"
 	source "package/python-crossbar/Config.in"
 	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
+	source "package/python-cssselect2/Config.in"
 	source "package/python-cssutils/Config.in"
 	source "package/python-cycler/Config.in"
 	source "package/python-daemon/Config.in"
diff --git a/package/python-cssselect2/Config.in b/package/python-cssselect2/Config.in
new file mode 100644
index 0000000000..0196471253
--- /dev/null
+++ b/package/python-cssselect2/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_CSSSELECT2
+	bool "python-cssselect2"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_TINYCSS2 # runtime
+	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
+	help
+	  CSS selectors for Python ElementTree.
+
+	  https://doc.courtbouillon.org/cssselect2/
diff --git a/package/python-cssselect2/python-cssselect2.hash b/package/python-cssselect2/python-cssselect2.hash
new file mode 100644
index 0000000000..ed5b863302
--- /dev/null
+++ b/package/python-cssselect2/python-cssselect2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/cssselect2/json
+md5  6dfd5963c8a5d85f2634d1650b1ddfe1  cssselect2-0.4.1.tar.gz
+sha256  93fbb9af860e95dd40bf18c3b2b6ed99189a07c0f29ba76f9c5be71344664ec8  cssselect2-0.4.1.tar.gz
+# Locally computed sha256 checksums
+sha256  6fd97229a1d1b0f6a8b41e109f413426dbc0874b1e03746d66cc33282601c2c2  LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
new file mode 100644
index 0000000000..18e0fba839
--- /dev/null
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cssselect2
+#
+################################################################################
+
+PYTHON_CSSSELECT2_VERSION = 0.4.1
+PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
+PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/ad/3d/fb764303deb34cbc1a32fcecdfd239367cb16323920c88390b2f5ad751f0
+PYTHON_CSSSELECT2_SETUP_TYPE = distutils
+PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
+PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
