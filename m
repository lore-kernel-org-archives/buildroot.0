Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D026C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0343683168;
	Tue,  6 Feb 2024 17:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bKU4pyJo-RIy; Tue,  6 Feb 2024 17:56:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A59138319F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A59138319F;
	Tue,  6 Feb 2024 17:56:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D46F71BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC16340B67
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC16340B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f5V58dKDNJM1 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:56:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53BA240A39
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53BA240A39
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A925873AE; Tue,  6 Feb 2024 17:56:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 18:53:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c77a7acb8806a775cd6365c1c5de0f03141e138f
X-Git-Newrev: 60a6188a8616fdf5b4c8d71c650ff014c29f7c32
X-Patchwork-Hint: ignore
Message-Id: <20240206175614.3A925873AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiosqlite: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=60a6188a8616fdf5b4c8d71c650ff014c29f7c32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                              |  1 +
 package/python-aiosqlite/Config.in             |  8 ++++++++
 package/python-aiosqlite/python-aiosqlite.hash |  5 +++++
 package/python-aiosqlite/python-aiosqlite.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 728bd03b80..b48f9eb1c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -978,6 +978,7 @@ menu "External python modules"
 	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
 	source "package/python-aiosignal/Config.in"
+	source "package/python-aiosqlite/Config.in"
 	source "package/python-aiozipkin/Config.in"
 	source "package/python-alembic/Config.in"
 	source "package/python-alsaaudio/Config.in"
diff --git a/package/python-aiosqlite/Config.in b/package/python-aiosqlite/Config.in
new file mode 100644
index 0000000000..c95c2b9510
--- /dev/null
+++ b/package/python-aiosqlite/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AIOSQLITE
+	bool "python-aiosqlite"
+	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
+	help
+	  aiosqlite provides a friendly, async interface to sqlite
+	  databases.
+
+	  https://aiosqlite.omnilib.dev
diff --git a/package/python-aiosqlite/python-aiosqlite.hash b/package/python-aiosqlite/python-aiosqlite.hash
new file mode 100644
index 0000000000..e06061346c
--- /dev/null
+++ b/package/python-aiosqlite/python-aiosqlite.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiosqlite/json
+md5  e829bf8f641ab115c1a9ca0494d35278  aiosqlite-0.19.0.tar.gz
+sha256  95ee77b91c8d2808bd08a59fbebf66270e9090c3d92ffbf260dc0db0b979577d  aiosqlite-0.19.0.tar.gz
+# Locally computed sha256 checksums
+sha256  ab0c171dc3ef8bf325a84bb77d855421f2611335ddf6e08816b2922c4edc0f76  LICENSE
diff --git a/package/python-aiosqlite/python-aiosqlite.mk b/package/python-aiosqlite/python-aiosqlite.mk
new file mode 100644
index 0000000000..e513d53c02
--- /dev/null
+++ b/package/python-aiosqlite/python-aiosqlite.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-aiosqlite
+#
+################################################################################
+
+PYTHON_AIOSQLITE_VERSION = 0.19.0
+PYTHON_AIOSQLITE_SOURCE = aiosqlite-$(PYTHON_AIOSQLITE_VERSION).tar.gz
+PYTHON_AIOSQLITE_SITE = https://files.pythonhosted.org/packages/ea/51/060efa10a814145acd4e42c6e5ed540b8714cad52ca026c5930e7c473049
+PYTHON_AIOSQLITE_SETUP_TYPE = flit
+PYTHON_AIOSQLITE_LICENSE = MIT
+PYTHON_AIOSQLITE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
