Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA42C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72E9A701FE;
	Tue, 21 Feb 2023 02:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E9A701FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3x4WkPQ51lHP; Tue, 21 Feb 2023 02:02:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ECCC7014A;
	Tue, 21 Feb 2023 02:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ECCC7014A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 315AE1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85B7A70049
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85B7A70049
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JOjiLnnkWPnO for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AD1C70040
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AD1C70040
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 790FB7FF06; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 23:22:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3e9f0dc59a5c4310139040f88189d10ad0b76906
X-Git-Newrev: d00e437922fb1b611f35c3138b9fbf7bcff62757
X-Patchwork-Hint: ignore
Message-Id: <20230220205301.790FB7FF06@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-flask-smorest:
 new package
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
Content-Type: multipart/mixed; boundary="===============8377869696176540018=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8377869696176540018==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d00e437922fb1b611f35c3138b9fbf7bcff62757
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/python-flask-smorest/Config.in                 | 11 +++++++++++
 package/python-flask-smorest/python-flask-smorest.hash |  5 +++++
 package/python-flask-smorest/python-flask-smorest.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bcf377d3d4..f8451c7fec 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1967,6 +1967,7 @@ F:	package/zic/
 
 N:	Martin Hundebøll <martin@geanix.com>
 F:	package/python-apispec/
+F:	package/python-flask-smorest/
 F:	package/python-marshmallow/
 F:	package/python-marshmallow-sqlalchemy/
 F:	package/python-webargs/
diff --git a/package/Config.in b/package/Config.in
index 3807050eeb..0af4adffa5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1058,6 +1058,7 @@ menu "External python modules"
 	source "package/python-flask-expects-json/Config.in"
 	source "package/python-flask-jsonrpc/Config.in"
 	source "package/python-flask-login/Config.in"
+	source "package/python-flask-smorest/Config.in"
 	source "package/python-flask-sqlalchemy/Config.in"
 	source "package/python-flask-wtf/Config.in"
 	source "package/python-flatbuffers/Config.in"
diff --git a/package/python-flask-smorest/Config.in b/package/python-flask-smorest/Config.in
new file mode 100644
index 0000000000..a8ccfbd9f7
--- /dev/null
+++ b/package/python-flask-smorest/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_FLASK_SMOREST
+	bool "python-flask-smorest"
+	select BR2_PACKAGE_PYTHON_APISPEC # runtime
+	select BR2_PACKAGE_PYTHON_FLASK # runtime
+	select BR2_PACKAGE_PYTHON_MARSHMALLOW # runtime
+	select BR2_PACKAGE_PYTHON_WEBARGS # runtime
+	select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
+	help
+	  Flask/Marshmallow-based REST API framework.
+
+	  https://github.com/marshmallow-code/flask-smorest
diff --git a/package/python-flask-smorest/python-flask-smorest.hash b/package/python-flask-smorest/python-flask-smorest.hash
new file mode 100644
index 0000000000..5abe0c5033
--- /dev/null
+++ b/package/python-flask-smorest/python-flask-smorest.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/flask-smorest/json
+md5  1dad52f26c59ca2dcaf0c5d109879605  flask-smorest-0.40.0.tar.gz
+sha256  9b46b4937ccf78702d99fed8cfd1cd5c37608ddefd65ff16a86d1ad5c7f7d8c0  flask-smorest-0.40.0.tar.gz
+# Locally computed sha256 checksums
+sha256	40999ea1d9c1b8202fa44f8e6849a557e22df892481e067abf999879064b9521  LICENSE
diff --git a/package/python-flask-smorest/python-flask-smorest.mk b/package/python-flask-smorest/python-flask-smorest.mk
new file mode 100644
index 0000000000..069d9244dd
--- /dev/null
+++ b/package/python-flask-smorest/python-flask-smorest.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-flask-smorest
+#
+################################################################################
+
+PYTHON_FLASK_SMOREST_VERSION = 0.40.0
+PYTHON_FLASK_SMOREST_SOURCE = flask-smorest-$(PYTHON_FLASK_SMOREST_VERSION).tar.gz
+PYTHON_FLASK_SMOREST_SITE = https://files.pythonhosted.org/packages/e6/b5/1b81ea4f7e377cf8a653aa10c249656a1c73de7a3695b2544d7a713ea3c2
+PYTHON_FLASK_SMOREST_SETUP_TYPE = setuptools
+PYTHON_FLASK_SMOREST_LICENSE = MIT
+PYTHON_FLASK_SMOREST_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

--===============8377869696176540018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8377869696176540018==--
