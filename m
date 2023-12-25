Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAC2C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60AC240119;
	Mon, 25 Dec 2023 20:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60AC240119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JAtMF89Ccc-i; Mon, 25 Dec 2023 20:42:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2046A40488;
	Mon, 25 Dec 2023 20:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2046A40488
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B16581BF228
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A21740534
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A21740534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XDOFCmV3ioqD for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FAE140488
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FAE140488
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E55D831FC; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 21:20:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e0ac9660c7247d7283d27560dbe661dadf25c03
X-Git-Newrev: 607f0ecb7e43a3d24030da3d683f0a32e2802865
X-Patchwork-Hint: ignore
Message-Id: <20231225204212.3E55D831FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi-sessions: new
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

commit: https://git.buildroot.net/buildroot/commit/?id=607f0ecb7e43a3d24030da3d683f0a32e2802865
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                          |  1 +
 package/python-fastapi-sessions/Config.in                  | 10 ++++++++++
 .../python-fastapi-sessions/python-fastapi-sessions.hash   |  5 +++++
 package/python-fastapi-sessions/python-fastapi-sessions.mk | 14 ++++++++++++++
 4 files changed, 30 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7beedf3b0c..9108ce5e25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1083,6 +1083,7 @@ menu "External python modules"
 	source "package/python-executing/Config.in"
 	source "package/python-falcon/Config.in"
 	source "package/python-fastapi/Config.in"
+	source "package/python-fastapi-sessions/Config.in"
 	source "package/python-filelock/Config.in"
 	source "package/python-fire/Config.in"
 	source "package/python-flask/Config.in"
diff --git a/package/python-fastapi-sessions/Config.in b/package/python-fastapi-sessions/Config.in
new file mode 100644
index 0000000000..a54b072f09
--- /dev/null
+++ b/package/python-fastapi-sessions/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_FASTAPI_SESSIONS
+	bool "python-fastapi-sessions"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_FASTAPI # runtime
+	select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
+	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	help
+	  Ready-to-use session library for FastAPI.
+
+	  https://github.com/jordanisaacs/fastapi-sessions
diff --git a/package/python-fastapi-sessions/python-fastapi-sessions.hash b/package/python-fastapi-sessions/python-fastapi-sessions.hash
new file mode 100644
index 0000000000..dd5e224bde
--- /dev/null
+++ b/package/python-fastapi-sessions/python-fastapi-sessions.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/fastapi-sessions/json
+md5  397ee37291bdbb7330ef8f4af378cd28  fastapi-sessions-0.3.2.tar.gz
+sha256  5159023fd548f8a9c198a966cf1086a73a43038cf3b9b79175fe33129f15e64c  fastapi-sessions-0.3.2.tar.gz
+# Locally computed sha256 checksums
+sha256  4962ee6d7777ff7d2f96ad81424c2e78d73ea7f6282d368afa14a7500c2d223e  LICENSE
diff --git a/package/python-fastapi-sessions/python-fastapi-sessions.mk b/package/python-fastapi-sessions/python-fastapi-sessions.mk
new file mode 100644
index 0000000000..abfb41b5b6
--- /dev/null
+++ b/package/python-fastapi-sessions/python-fastapi-sessions.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-fastapi-sessions
+#
+################################################################################
+
+PYTHON_FASTAPI_SESSIONS_VERSION = 0.3.2
+PYTHON_FASTAPI_SESSIONS_SOURCE = fastapi-sessions-$(PYTHON_FASTAPI_SESSIONS_VERSION).tar.gz
+PYTHON_FASTAPI_SESSIONS_SITE = https://files.pythonhosted.org/packages/1d/89/da83ba47bd70101e14eca0ac57c7f300b055b70104446badfdc1dcbe813f
+PYTHON_FASTAPI_SESSIONS_SETUP_TYPE = setuptools
+PYTHON_FASTAPI_SESSIONS_LICENSE = MIT
+PYTHON_FASTAPI_SESSIONS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
