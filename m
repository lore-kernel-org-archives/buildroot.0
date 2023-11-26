Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32B3C4167B
	for <buildroot@archiver.kernel.org>; Sun, 26 Nov 2023 17:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70EC6606F5;
	Sun, 26 Nov 2023 17:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70EC6606F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FlrDB2EuSXKl; Sun, 26 Nov 2023 17:11:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6D2560BB5;
	Sun, 26 Nov 2023 17:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6D2560BB5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A7AA1BF28A
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F30C0812CF
 for <buildroot@lists.busybox.net>; Sun, 26 Nov 2023 17:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F30C0812CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6pZEDrusH_dF for <buildroot@lists.busybox.net>;
 Sun, 26 Nov 2023 17:10:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 298E680F4D
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 17:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 298E680F4D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D8DC87407; Sun, 26 Nov 2023 17:10:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Nov 2023 18:05:21 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0f26d434278ac641815e0fd856cc771d65f91617
X-Git-Newrev: 92fcdbd3e23aa03326d203271d02595409452690
X-Patchwork-Hint: ignore
Message-Id: <20231126171049.0D8DC87407@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-pydantic-core:
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

commit: https://git.buildroot.net/buildroot/commit/?id=92fcdbd3e23aa03326d203271d02595409452690
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Although pydantic-core likely implements a subset of the functionality
in pydantic 1.10.8 as we currently package, there will not be any
conflict as the modules namespace differ:

    import pydantic  # 1.10.8
    import pydantic_core

So, we can add pydantic-core, then bump pydantic; we don't need to do
both in the same commit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: add explanations from James about no-conflict]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                      |  1 +
 package/python-pydantic-core/Config.in                 |  8 ++++++++
 package/python-pydantic-core/python-pydantic-core.hash |  4 ++++
 package/python-pydantic-core/python-pydantic-core.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 68e6e29a4d..fcc09b07c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1228,6 +1228,7 @@ menu "External python modules"
 	source "package/python-pycups/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pydantic/Config.in"
+	source "package/python-pydantic-core/Config.in"
 	source "package/python-pydevmem/Config.in"
 	source "package/python-pydyf/Config.in"
 	source "package/python-pyelftools/Config.in"
diff --git a/package/python-pydantic-core/Config.in b/package/python-pydantic-core/Config.in
new file mode 100644
index 0000000000..3eeb1844a2
--- /dev/null
+++ b/package/python-pydantic-core/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_PYDANTIC_CORE
+	bool "python-pydantic-core"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  Core validation logic for pydantic written in rust.
+
+	  https://github.com/pydantic/pydantic-core
diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
new file mode 100644
index 0000000000..4927d816be
--- /dev/null
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -0,0 +1,4 @@
+# Locally calculated after vendoring
+sha256  b54296f8317e7ffd72726836636aa3a6c8c977d8f73b68253c443c0fe3731064  pydantic_core-2.14.5.tar.gz
+# Locally computed sha256 checksums
+sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
new file mode 100644
index 0000000000..8b61323ab3
--- /dev/null
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pydantic-core
+#
+################################################################################
+
+PYTHON_PYDANTIC_CORE_VERSION = 2.14.5
+PYTHON_PYDANTIC_CORE_SOURCE = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
+PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae14a4b073ecbc47fc36a9979c7aa888b245
+PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
+PYTHON_PYDANTIC_CORE_LICENSE = MIT
+PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
+PYTHON_PYDANTIC_CORE_DEPENDENCIES = host-python-typing-extensions
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
