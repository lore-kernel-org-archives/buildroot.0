Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C404C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D02CD8107C;
	Tue, 23 Jul 2024 09:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1CQ67l2ZTjY; Tue, 23 Jul 2024 09:32:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C74B781088
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C74B781088;
	Tue, 23 Jul 2024 09:32:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4572C1BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31D6181088
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MR8Ci0GTlYgv for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:32:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EB168107C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EB168107C
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:32:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5624F8738F; Tue, 23 Jul 2024 09:32:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 11:30:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 591f6d108bbb3df288a473393abdab511b56b6dc
X-Git-Newrev: f7c48e2ca40fa3f5622210a8c553405d35364c6f
X-Patchwork-Hint: ignore
Message-Id: <20240723093232.5624F8738F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-collections: new
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f7c48e2ca40fa3f5622210a8c553405d35364c6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                         |  1 +
 package/python-jaraco-collections/Config.in               |  8 ++++++++
 .../python-jaraco-collections.hash                        |  5 +++++
 .../python-jaraco-collections.mk                          | 15 +++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1e80912851..09347f7944 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1166,6 +1166,7 @@ menu "External python modules"
 	source "package/python-iwlib/Config.in"
 	source "package/python-janus/Config.in"
 	source "package/python-jaraco-classes/Config.in"
+	source "package/python-jaraco-collections/Config.in"
 	source "package/python-jaraco-context/Config.in"
 	source "package/python-jaraco-functools/Config.in"
 	source "package/python-jaraco-text/Config.in"
diff --git a/package/python-jaraco-collections/Config.in b/package/python-jaraco-collections/Config.in
new file mode 100644
index 0000000000..a6fa721d4d
--- /dev/null
+++ b/package/python-jaraco-collections/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_JARACO_COLLECTIONS
+	bool "python-jaraco-collections"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jaraco-text -> python-inflect -> python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_JARACO_TEXT # runtime
+	help
+	  Collection objects similar to those in stdlib by jaraco.
+
+	  https://github.com/jaraco/jaraco.collections
diff --git a/package/python-jaraco-collections/python-jaraco-collections.hash b/package/python-jaraco-collections/python-jaraco-collections.hash
new file mode 100644
index 0000000000..0308d48641
--- /dev/null
+++ b/package/python-jaraco-collections/python-jaraco-collections.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jaraco.collections/json
+md5  2b12f44216432f1ce2ead377fd7a2b93  jaraco.collections-5.0.0.tar.gz
+sha256  1680e8d09f295f625c7ba926880175a26fdbe7092b4c76d198e30476b21cfe68  jaraco.collections-5.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-jaraco-collections/python-jaraco-collections.mk b/package/python-jaraco-collections/python-jaraco-collections.mk
new file mode 100644
index 0000000000..1400e286ee
--- /dev/null
+++ b/package/python-jaraco-collections/python-jaraco-collections.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-jaraco-collections
+#
+################################################################################
+
+PYTHON_JARACO_COLLECTIONS_VERSION = 5.0.0
+PYTHON_JARACO_COLLECTIONS_SOURCE = jaraco.collections-$(PYTHON_JARACO_COLLECTIONS_VERSION).tar.gz
+PYTHON_JARACO_COLLECTIONS_SITE = https://files.pythonhosted.org/packages/e6/85/9c4ab9772bcc2c9b4beffd56aca70f646e4a1f3a576579fa401d742b46a8
+PYTHON_JARACO_COLLECTIONS_SETUP_TYPE = setuptools
+PYTHON_JARACO_COLLECTIONS_LICENSE = MIT
+PYTHON_JARACO_COLLECTIONS_LICENSE_FILES = LICENSE
+PYTHON_JARACO_COLLECTIONS_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
