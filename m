Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FE4C3DA7E
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 890A740A2F;
	Tue, 23 Jul 2024 09:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0hrkPwfQ2ga; Tue, 23 Jul 2024 09:29:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8FD740A25
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8FD740A25;
	Tue, 23 Jul 2024 09:29:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED1BD1BF969
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA6D780FA6
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zDC7pm9DOPPU for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 071D380B4D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 071D380B4D
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:28:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0036387144; Tue, 23 Jul 2024 09:28:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 10:59:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6f3278539216f55fb18ff7e63ce2da39ed0c3e1
X-Git-Newrev: dece0a512daf03f20bcf9048e3f702da952b8546
X-Patchwork-Hint: ignore
Message-Id: <20240723092858.0036387144@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-inflect: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=dece0a512daf03f20bcf9048e3f702da952b8546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                          |  1 +
 package/python-inflect/Config.in           | 10 ++++++++++
 package/python-inflect/python-inflect.hash |  5 +++++
 package/python-inflect/python-inflect.mk   | 15 +++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3f60d2f037..daf7206957 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1149,6 +1149,7 @@ menu "External python modules"
 	source "package/python-idna/Config.in"
 	source "package/python-ifaddr/Config.in"
 	source "package/python-incremental/Config.in"
+	source "package/python-inflect/Config.in"
 	source "package/python-inflection/Config.in"
 	source "package/python-influxdb/Config.in"
 	source "package/python-iniconfig/Config.in"
diff --git a/package/python-inflect/Config.in b/package/python-inflect/Config.in
new file mode 100644
index 0000000000..daf6bd4a32
--- /dev/null
+++ b/package/python-inflect/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_INFLECT
+	bool "python-inflect"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  Correctly generate plurals, singular nouns, ordinals,
+	  indefinite articles; convert numbers to words.
+
+	  https://github.com/jaraco/inflect
diff --git a/package/python-inflect/python-inflect.hash b/package/python-inflect/python-inflect.hash
new file mode 100644
index 0000000000..3faa4cc5a5
--- /dev/null
+++ b/package/python-inflect/python-inflect.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/inflect/json
+md5  61c670cf5c4d09314f6a4d3b99d3b98d  inflect-7.0.0.tar.gz
+sha256  63da9325ad29da81ec23e055b41225795ab793b4ecb483be5dc1fa363fd4717e  inflect-7.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-inflect/python-inflect.mk b/package/python-inflect/python-inflect.mk
new file mode 100644
index 0000000000..cef4c06627
--- /dev/null
+++ b/package/python-inflect/python-inflect.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-inflect
+#
+################################################################################
+
+PYTHON_INFLECT_VERSION = 7.0.0
+PYTHON_INFLECT_SOURCE = inflect-$(PYTHON_INFLECT_VERSION).tar.gz
+PYTHON_INFLECT_SITE = https://files.pythonhosted.org/packages/9f/90/1d0a889847fdce963ebe9684de24a749e4fad627bf595e9f0d32730f85a8
+PYTHON_INFLECT_SETUP_TYPE = setuptools
+PYTHON_INFLECT_LICENSE = MIT
+PYTHON_INFLECT_LICENSE_FILES = LICENSE
+PYTHON_INFLECT_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
