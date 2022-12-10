Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A61C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2107F4EF11;
	Mon, 20 Feb 2023 22:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2107F4EF11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fb-_YwzDnnXW; Mon, 20 Feb 2023 22:11:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E29824EF1F;
	Mon, 20 Feb 2023 22:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E29824EF1F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A0D61BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9656B6115A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9656B6115A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYjBzjU1oN0m for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BBE06114A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BBE06114A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 885308648F; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 21:20:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8de04b2cb6d4734665c332d8714006ba77e8b962
X-Git-Newrev: 002a5f7ced3d148655ee0d58f5dc61a509d9e218
X-Patchwork-Hint: ignore
Message-Id: <20230220205200.885308648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-munch: new
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=002a5f7ced3d148655ee0d58f5dc61a509d9e218
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                      |  1 +
 package/python-munch/Config.in         |  7 +++++++
 package/python-munch/python-munch.hash |  5 +++++
 package/python-munch/python-munch.mk   | 15 +++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f4a423c7a6..d5a673295d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1128,6 +1128,7 @@ menu "External python modules"
 	source "package/python-msgfy/Config.in"
 	source "package/python-msgpack/Config.in"
 	source "package/python-multidict/Config.in"
+	source "package/python-munch/Config.in"
 	source "package/python-mutagen/Config.in"
 	source "package/python-mwclient/Config.in"
 	source "package/python-mwscrape/Config.in"
diff --git a/package/python-munch/Config.in b/package/python-munch/Config.in
new file mode 100644
index 0000000000..9db2623674
--- /dev/null
+++ b/package/python-munch/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_MUNCH
+	bool "python-munch"
+	help
+	  Munch is a dictionary that supports attribute-style access,
+	  a la JavaScript.
+
+	  https://github.com/Infinidat/munch
diff --git a/package/python-munch/python-munch.hash b/package/python-munch/python-munch.hash
new file mode 100644
index 0000000000..7e32282833
--- /dev/null
+++ b/package/python-munch/python-munch.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/munch/json
+md5  ed84c3718416c8d4d03d0a6ef46e8e0c  munch-2.5.0.tar.gz
+sha256  2d735f6f24d4dba3417fa448cae40c6e896ec1fdab6cdb5e6510999758a4dbd2  munch-2.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  57ca95c92059c8380625192462979bd32994aae3fcdf902ff6eb1e467eeb0469  LICENSE.txt
diff --git a/package/python-munch/python-munch.mk b/package/python-munch/python-munch.mk
new file mode 100644
index 0000000000..85f6803f07
--- /dev/null
+++ b/package/python-munch/python-munch.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-munch
+#
+################################################################################
+
+PYTHON_MUNCH_VERSION = 2.5.0
+PYTHON_MUNCH_SOURCE = munch-$(PYTHON_MUNCH_VERSION).tar.gz
+PYTHON_MUNCH_SITE = https://files.pythonhosted.org/packages/43/a1/ec48010724eedfe2add68eb7592a0d238590e14e08b95a4ffb3c7b2f0808
+PYTHON_MUNCH_SETUP_TYPE = setuptools
+PYTHON_MUNCH_LICENSE = MIT
+PYTHON_MUNCH_LICENSE_FILES = LICENSE.txt
+PYTHON_MUNCH_DEPENDENCIES = host-python-pbr
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
