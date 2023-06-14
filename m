Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D094EB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 11:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A156C41C6C;
	Wed, 14 Jun 2023 11:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A156C41C6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iz8ZgPZbESND; Wed, 14 Jun 2023 11:56:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39AF341DB5;
	Wed, 14 Jun 2023 11:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39AF341DB5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53E291BF966
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA2DE832E6
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA2DE832E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9w-IqNbtj-M for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 11:53:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0003831CA
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 11:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0003831CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD5358363F; Wed, 14 Jun 2023 11:53:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 12:26:12 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 310d23040aef9b0f85878310b5ed4d989c2e6777
X-Git-Newrev: 776a6e293f338bdfd2beb4b424f5d34762250d91
X-Patchwork-Hint: ignore
Message-Id: <20230614115309.CD5358363F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-asttokens:
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=776a6e293f338bdfd2beb4b424f5d34762250d91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Peter: fix alphabetical ordering]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aa5c233c36bcc8fd51c84f7776c1b3a2875a3d98)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                              |  1 +
 package/python-asttokens/Config.in             |  7 +++++++
 package/python-asttokens/python-asttokens.hash |  5 +++++
 package/python-asttokens/python-asttokens.mk   | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 440c8e92ff..a452699a47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -967,6 +967,7 @@ menu "External python modules"
 	source "package/python-arrow/Config.in"
 	source "package/python-asgiref/Config.in"
 	source "package/python-asn1crypto/Config.in"
+	source "package/python-asttokens/Config.in"
 	source "package/python-async-generator/Config.in"
 	source "package/python-async-lru/Config.in"
 	source "package/python-async-timeout/Config.in"
diff --git a/package/python-asttokens/Config.in b/package/python-asttokens/Config.in
new file mode 100644
index 0000000000..2732b8124b
--- /dev/null
+++ b/package/python-asttokens/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ASTTOKENS
+	bool "python-asttokens"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Annotate AST trees with source code positions.
+
+	  https://github.com/gristlabs/asttokens
diff --git a/package/python-asttokens/python-asttokens.hash b/package/python-asttokens/python-asttokens.hash
new file mode 100644
index 0000000000..6529e4db41
--- /dev/null
+++ b/package/python-asttokens/python-asttokens.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/asttokens/json
+md5  a9ae6ae0f85398e511bcb9ec87695eed  asttokens-2.2.1.tar.gz
+sha256  4622110b2a6f30b77e1473affaa97e711bc2f07d3f10848420ff1898edbe94f3  asttokens-2.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/python-asttokens/python-asttokens.mk b/package/python-asttokens/python-asttokens.mk
new file mode 100644
index 0000000000..8a8ce1ddd9
--- /dev/null
+++ b/package/python-asttokens/python-asttokens.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-asttokens
+#
+################################################################################
+
+PYTHON_ASTTOKENS_VERSION = 2.2.1
+PYTHON_ASTTOKENS_SOURCE = asttokens-$(PYTHON_ASTTOKENS_VERSION).tar.gz
+PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/c8/e3/b0b4f32162621126fbdaba636c152c6b6baec486c99f48686e66343d638f
+PYTHON_ASTTOKENS_SETUP_TYPE = setuptools
+PYTHON_ASTTOKENS_LICENSE = Apache-2.0
+PYTHON_ASTTOKENS_LICENSE_FILES = LICENSE
+
+PYTHON_ASTTOKENS_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
