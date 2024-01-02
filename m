Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B738EC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41E33400CB;
	Tue,  2 Jan 2024 22:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41E33400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKLMFp-tH7Vn; Tue,  2 Jan 2024 22:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E5BC4014B;
	Tue,  2 Jan 2024 22:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E5BC4014B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF9921BF966
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B836C416E4
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B836C416E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SsBzbrXQs9h for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC1CE4161A
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC1CE4161A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B86E3835B1; Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 23:34:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3217fedcb8c8006809c1a3d214c97597677a07fd
X-Git-Newrev: 34b9fa1caaddf11e52953f087eeb9cf9c26cbd62
X-Patchwork-Hint: ignore
Message-Id: <20240102223939.B86E3835B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cachetools: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=34b9fa1caaddf11e52953f087eeb9cf9c26cbd62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                |  1 +
 package/python-cachetools/Config.in              |  6 ++++++
 package/python-cachetools/python-cachetools.hash |  5 +++++
 package/python-cachetools/python-cachetools.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d538083b76..af330eeacf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1015,6 +1015,7 @@ menu "External python modules"
 	source "package/python-brotli/Config.in"
 	source "package/python-bsdiff4/Config.in"
 	source "package/python-cached-property/Config.in"
+	source "package/python-cachetools/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-canopen/Config.in"
 	source "package/python-cbor/Config.in"
diff --git a/package/python-cachetools/Config.in b/package/python-cachetools/Config.in
new file mode 100644
index 0000000000..550e3d2560
--- /dev/null
+++ b/package/python-cachetools/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CACHETOOLS
+	bool "python-cachetools"
+	help
+	  Extensible memoizing collections and decorators.
+
+	  https://github.com/tkem/cachetools/
diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
new file mode 100644
index 0000000000..7b6b939191
--- /dev/null
+++ b/package/python-cachetools/python-cachetools.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/cachetools/json
+md5  5317c13b69c4021e925a2fbbc199bcc9  cachetools-5.3.2.tar.gz
+sha256  086ee420196f7b2ab9ca2db2520aca326318b68fe5ba8bc4d49cca91add450f2  cachetools-5.3.2.tar.gz
+# Locally computed sha256 checksums
+sha256  76260c1370a7d41d5fac71a27d781f3add5d7249adfbbfa930846d2d9e47dbd5  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
new file mode 100644
index 0000000000..c841e0761f
--- /dev/null
+++ b/package/python-cachetools/python-cachetools.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cachetools
+#
+################################################################################
+
+PYTHON_CACHETOOLS_VERSION = 5.3.2
+PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/10/21/1b6880557742c49d5b0c4dcf0cf544b441509246cdd71182e0847ac859d5
+PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
+PYTHON_CACHETOOLS_LICENSE = MIT
+PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
