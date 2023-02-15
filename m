Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0EBC64ED6
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 22:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9EDD80C67;
	Wed, 15 Feb 2023 22:23:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9EDD80C67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZadGEFTVbTd; Wed, 15 Feb 2023 22:23:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7EC580BC9;
	Wed, 15 Feb 2023 22:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7EC580BC9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 134921BF476
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 22:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1D1E40C45
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 22:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1D1E40C45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0PSSuihFFzPp for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 22:22:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1876740147
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 22:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1876740147
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06C4E85F32; Wed, 15 Feb 2023 22:22:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 23:21:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c3e7014105eb69db7d9c9f662ab0a5054f35797
X-Git-Newrev: 3e9f0dc59a5c4310139040f88189d10ad0b76906
X-Patchwork-Hint: ignore
Message-Id: <20230215222259.06C4E85F32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-marshmallow-sqlalchemy: new
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
Content-Type: multipart/mixed; boundary="===============2784779124041804067=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2784779124041804067==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3e9f0dc59a5c4310139040f88189d10ad0b76906
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Hundeboll <martin@geanix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/python-marshmallow-sqlalchemy/Config.in            | 10 ++++++++++
 .../python-marshmallow-sqlalchemy.hash                     |  5 +++++
 .../python-marshmallow-sqlalchemy.mk                       | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2b05714e9c..bcf377d3d4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1968,6 +1968,7 @@ F:	package/zic/
 N:	Martin Hundebøll <martin@geanix.com>
 F:	package/python-apispec/
 F:	package/python-marshmallow/
+F:	package/python-marshmallow-sqlalchemy/
 F:	package/python-webargs/
 
 N:	Martin Kepplinger <martink@posteo.de>
diff --git a/package/Config.in b/package/Config.in
index ece35f12c8..3807050eeb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1130,6 +1130,7 @@ menu "External python modules"
 	source "package/python-markdown2/Config.in"
 	source "package/python-markupsafe/Config.in"
 	source "package/python-marshmallow/Config.in"
+	source "package/python-marshmallow-sqlalchemy/Config.in"
 	source "package/python-matplotlib/Config.in"
 	source "package/python-mbstrdecoder/Config.in"
 	source "package/python-memory-profiler/Config.in"
diff --git a/package/python-marshmallow-sqlalchemy/Config.in b/package/python-marshmallow-sqlalchemy/Config.in
new file mode 100644
index 0000000000..f48d27edd6
--- /dev/null
+++ b/package/python-marshmallow-sqlalchemy/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_MARSHMALLOW_SQLALCHEMY
+	bool "python-marshmallow-sqlalchemy"
+	select BR2_PACKAGE_PYTHON_MARSHMALLOW # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
+	select BR2_PACKAGE_PYTHON_SQLALCHEMY # runtime
+	help
+	  SQLAlchemy integration with the marshmallow
+	  (de)serialization library.
+
+	  https://github.com/marshmallow-code/marshmallow-sqlalchemy
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
new file mode 100644
index 0000000000..6b847de94d
--- /dev/null
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
+md5  5e012b07ccf4ad67dbd3f38cc68cb1f4  marshmallow-sqlalchemy-0.28.1.tar.gz
+sha256  aa376747296780a56355e3067b9c8bf43a2a1c44ff985de82b3a5d9e161ca2b8  marshmallow-sqlalchemy-0.28.1.tar.gz
+# Locally computed sha256 checksums
+sha256  625df8e2758a271b4bc90525c0b6161814e0f72cb3504b03ab5206b7abf50072  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
new file mode 100644
index 0000000000..293ea29be6
--- /dev/null
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-marshmallow-sqlalchemy
+#
+################################################################################
+
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 0.28.1
+PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow-sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/eb/96/3895bde2247fa653c36d887ff08e439665668aa7c991a3924ae199be88d6
+PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = setuptools
+PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
+PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))

--===============2784779124041804067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2784779124041804067==--
