Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A80C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED24B84BB6;
	Mon,  6 Dec 2021 18:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dncCxQPQkUJq; Mon,  6 Dec 2021 18:41:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B3ED80DC2;
	Mon,  6 Dec 2021 18:41:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 286BE1BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5697541C5C
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lf8T904gTOPS for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDE6041C0A
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 74E6281468; Mon,  6 Dec 2021 18:07:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:35:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53972c82964dd1337dff4ccbcdd484d243aef0ba
X-Git-Newrev: ee80fbcc791c47a3b722f59eccea5dfec1d0c8c1
X-Patchwork-Hint: ignore
Message-Id: <20211206180742.74E6281468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydyf: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee80fbcc791c47a3b722f59eccea5dfec1d0c8c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-pydyf/Config.in         |  7 +++++++
 package/python-pydyf/python-pydyf.hash |  5 +++++
 package/python-pydyf/python-pydyf.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 82853cdc18..6fc6c6286f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1266,6 +1266,7 @@ F:	package/python-janus/
 F:	package/python-logstash/
 F:	package/python-multidict/
 F:	package/python-pycares/
+F:	package/python-pydyf/
 F:	package/python-pyphen/
 F:	package/python-snappy/
 F:	package/python-sockjs/
diff --git a/package/Config.in b/package/Config.in
index e90d30e81c..871295e66f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1143,6 +1143,7 @@ menu "External python modules"
 	source "package/python-pycups/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pydantic/Config.in"
+	source "package/python-pydyf/Config.in"
 	source "package/python-pyelftools/Config.in"
 	source "package/python-pyftpdlib/Config.in"
 	source "package/python-pygame/Config.in"
diff --git a/package/python-pydyf/Config.in b/package/python-pydyf/Config.in
new file mode 100644
index 0000000000..f283a6d6aa
--- /dev/null
+++ b/package/python-pydyf/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PYDYF
+	bool "python-pydyf"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  A low-level PDF generator.
+
+	  https://www.courtbouillon.org/pydyf
diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
new file mode 100644
index 0000000000..90774457a1
--- /dev/null
+++ b/package/python-pydyf/python-pydyf.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pydyf/json
+md5  f78ee205b0637c92197f5d584d60cb8e  pydyf-0.1.2.tar.gz
+sha256  1e2f5de48174f505de025a7d1e7cf01bbdd9422ca8ab9451782bf00ee178602c  pydyf-0.1.2.tar.gz
+# Locally computed sha256 checksums
+sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
new file mode 100644
index 0000000000..7cc0df2643
--- /dev/null
+++ b/package/python-pydyf/python-pydyf.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pydyf
+#
+################################################################################
+
+PYTHON_PYDYF_VERSION = 0.1.2
+PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
+PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/78/ed/2ccc153d50d21a56916fd5c9d367cad798d4ca8a450cef03e7faa3b920c4
+PYTHON_PYDYF_SETUP_TYPE = distutils
+PYTHON_PYDYF_LICENSE = BSD-3-Clause
+PYTHON_PYDYF_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
