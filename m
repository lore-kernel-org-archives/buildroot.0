Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32564C4706F
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC1AD408A7;
	Mon, 25 Dec 2023 20:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC1AD408A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mouUsaAM8VQt; Mon, 25 Dec 2023 20:43:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4BE540119;
	Mon, 25 Dec 2023 20:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4BE540119
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BFC51BF228
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 012E940534
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 012E940534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uiyfojD0dGmx for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41F2C40119
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41F2C40119
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 303D481662; Mon, 25 Dec 2023 20:42:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 25 Dec 2023 21:19:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da1f15dbca77131751aa96c0701c4339aca95192
X-Git-Newrev: 8e0ac9660c7247d7283d27560dbe661dadf25c03
X-Patchwork-Hint: ignore
Message-Id: <20231225204212.303D481662@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uvicorn: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e0ac9660c7247d7283d27560dbe661dadf25c03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                          |  1 +
 package/python-uvicorn/Config.in           |  8 ++++++++
 package/python-uvicorn/python-uvicorn.hash |  5 +++++
 package/python-uvicorn/python-uvicorn.mk   | 15 +++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7f9069b75e..7beedf3b0c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1387,6 +1387,7 @@ menu "External python modules"
 	source "package/python-urllib3/Config.in"
 	source "package/python-urwid/Config.in"
 	source "package/python-urwid-readline/Config.in"
+	source "package/python-uvicorn/Config.in"
 	source "package/python-uvloop/Config.in"
 	source "package/python-validators/Config.in"
 	source "package/python-versiontools/Config.in"
diff --git a/package/python-uvicorn/Config.in b/package/python-uvicorn/Config.in
new file mode 100644
index 0000000000..3e769392f9
--- /dev/null
+++ b/package/python-uvicorn/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_UVICORN
+	bool "python-uvicorn"
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_H11 # runtime
+	help
+	  The lightning-fast ASGI server.
+
+	  https://www.uvicorn.org/
diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
new file mode 100644
index 0000000000..cfa999e210
--- /dev/null
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/uvicorn/json
+md5  a1af843e7e305d551030abfa09dd3b15  uvicorn-0.24.0.post1.tar.gz
+sha256  09c8e5a79dc466bdf28dead50093957db184de356fcdc48697bad3bde4c2588e  uvicorn-0.24.0.post1.tar.gz
+# Locally computed sha256 checksums
+sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
new file mode 100644
index 0000000000..887e4ac390
--- /dev/null
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-uvicorn
+#
+################################################################################
+
+PYTHON_UVICORN_VERSION = 0.24.0.post1
+PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/e5/84/d43ce8fe6b31a316ef0ed04ea0d58cab981bdf7f17f8423491fa8b4f50b6
+PYTHON_UVICORN_SETUP_TYPE = pep517
+PYTHON_UVICORN_LICENSE = BSD-3-Clause
+PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
+PYTHON_UVICORN_DEPENDENCIES = host-python-hatchling
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
