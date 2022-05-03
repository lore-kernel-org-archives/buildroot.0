Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7449AC433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 19:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 256A060E4C;
	Tue,  3 May 2022 19:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UU6Iea28R1-o; Tue,  3 May 2022 19:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C758060D69;
	Tue,  3 May 2022 19:29:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4867F1BF33A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 444E940207
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eNEMz6_wS-i6 for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 19:29:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DE92400F8
 for <buildroot@buildroot.org>; Tue,  3 May 2022 19:29:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4F2FC8516C; Tue,  3 May 2022 19:19:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 May 2022 21:29:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9ac60d52a0a44281eb0a9ae9bb876942168edbb
X-Git-Newrev: d5bcdb74b6bf2e0afa5952fe26fea7c74050be59
X-Patchwork-Hint: ignore
Message-Id: <20220503191909.4F2FC8516C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydevmem: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5bcdb74b6bf2e0afa5952fe26fea7c74050be59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python DevMem is designed primarily for use with accessing
/dev/mem on OMAP platforms. It should work on other platforms
and work to mmap() files rather then just /dev/mem, but these
use cases aren't well tested.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                            |  1 +
 package/python-pydevmem/Config.in            |  9 +++++++++
 package/python-pydevmem/python-pydevmem.hash |  3 +++
 package/python-pydevmem/python-pydevmem.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4687dd4426..66682b9b2d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1151,6 +1151,7 @@ menu "External python modules"
 	source "package/python-pycups/Config.in"
 	source "package/python-pydal/Config.in"
 	source "package/python-pydantic/Config.in"
+	source "package/python-pydevmem/Config.in"
 	source "package/python-pydyf/Config.in"
 	source "package/python-pyelftools/Config.in"
 	source "package/python-pyftpdlib/Config.in"
diff --git a/package/python-pydevmem/Config.in b/package/python-pydevmem/Config.in
new file mode 100644
index 0000000000..a0e2da9f0b
--- /dev/null
+++ b/package/python-pydevmem/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYDEVMEM
+	bool "python-pydevmem"
+	help
+	  Python DevMem is designed primarily for use with accessing
+	  /dev/mem on OMAP platforms. It should work on other platforms
+	  and work to mmap() files rather then just /dev/mem, but these
+	  use cases aren't well tested.
+
+	  https://github.com/kylemanna/pydevmem
diff --git a/package/python-pydevmem/python-pydevmem.hash b/package/python-pydevmem/python-pydevmem.hash
new file mode 100644
index 0000000000..e9ee18b872
--- /dev/null
+++ b/package/python-pydevmem/python-pydevmem.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  1a72db41effeb83e01fc9a422abfe345a92220b0382403a5040b2811e4ee6496  python-pydevmem-600b5d1ef8997c394db3512b735d75d5abc4ad41.tar.gz
+sha256  cb013ffd1fd415a348f9a32231ceb133770623b69484a24ad49b6da4904cac2e  LICENSE
diff --git a/package/python-pydevmem/python-pydevmem.mk b/package/python-pydevmem/python-pydevmem.mk
new file mode 100644
index 0000000000..385b123290
--- /dev/null
+++ b/package/python-pydevmem/python-pydevmem.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-pydevmem
+#
+################################################################################
+
+PYTHON_PYDEVMEM_VERSION = 600b5d1ef8997c394db3512b735d75d5abc4ad41
+PYTHON_PYDEVMEM_SITE = $(call github,kylemanna,pydevmem,$(PYTHON_PYDEVMEM_VERSION))
+PYTHON_PYDEVMEM_SETUP_TYPE = setuptools
+PYTHON_PYDEVMEM_LICENSE = MIT
+PYTHON_PYDEVMEM_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
