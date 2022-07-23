Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C181C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3135D84C29;
	Sat, 23 Jul 2022 19:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3135D84C29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJGo-2uCxZYF; Sat, 23 Jul 2022 19:16:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17CA184C2B;
	Sat, 23 Jul 2022 19:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17CA184C2B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 278D91BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00A1D84C2F
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00A1D84C2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRluInMoHiJ8 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:16:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24B3184C2B
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24B3184C2B
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A440F84AF3; Sat, 23 Jul 2022 19:02:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:15:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2562e2e6eede20e1acaf0c47d4d040263177ec1e
X-Git-Newrev: 57522040017d07efaf5c52f7a12d06aee717738f
X-Patchwork-Hint: ignore
Message-Id: <20220723190228.A440F84AF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rfc3987: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=57522040017d07efaf5c52f7a12d06aee717738f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                          |  1 +
 package/python-rfc3987/Config.in           |  7 +++++++
 package/python-rfc3987/python-rfc3987.hash |  5 +++++
 package/python-rfc3987/python-rfc3987.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index fb11482f5b..de02f3388f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1211,6 +1211,7 @@ menu "External python modules"
 	source "package/python-requests/Config.in"
 	source "package/python-requests-oauthlib/Config.in"
 	source "package/python-requests-toolbelt/Config.in"
+	source "package/python-rfc3987/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rpi-ws281x/Config.in"
 	source "package/python-rsa/Config.in"
diff --git a/package/python-rfc3987/Config.in b/package/python-rfc3987/Config.in
new file mode 100644
index 0000000000..3cd74f5314
--- /dev/null
+++ b/package/python-rfc3987/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_RFC3987
+	bool "python-rfc3987"
+	help
+	  Parsing and validation of URIs (RFC 3986) and IRIs (RFC
+	  3987).
+
+	  http://pypi.python.org/pypi/rfc3987
diff --git a/package/python-rfc3987/python-rfc3987.hash b/package/python-rfc3987/python-rfc3987.hash
new file mode 100644
index 0000000000..013cee6161
--- /dev/null
+++ b/package/python-rfc3987/python-rfc3987.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/rfc3987/json
+md5  b6c4028acdc788a9ba697e1c1d6b896c  rfc3987-1.3.8.tar.gz
+sha256  d3c4d257a560d544e9826b38bc81db676890c79ab9d7ac92b39c7a253d5ca733  rfc3987-1.3.8.tar.gz
+# Locally computed sha256 checksums
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.txt
diff --git a/package/python-rfc3987/python-rfc3987.mk b/package/python-rfc3987/python-rfc3987.mk
new file mode 100644
index 0000000000..cad17e8de2
--- /dev/null
+++ b/package/python-rfc3987/python-rfc3987.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-rfc3987
+#
+################################################################################
+
+PYTHON_RFC3987_VERSION = 1.3.8
+PYTHON_RFC3987_SOURCE = rfc3987-$(PYTHON_RFC3987_VERSION).tar.gz
+PYTHON_RFC3987_SITE = https://files.pythonhosted.org/packages/14/bb/f1395c4b62f251a1cb503ff884500ebd248eed593f41b469f89caa3547bd
+PYTHON_RFC3987_SETUP_TYPE = setuptools
+PYTHON_RFC3987_LICENSE = GPL-3.0+
+PYTHON_RFC3987_LICENSE_FILES = COPYING.txt
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
