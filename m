Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D09C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53E8981EF7;
	Sun, 15 Sep 2024 21:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mZOA72t1fkC; Sun, 15 Sep 2024 21:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 310BD847EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 310BD847EF;
	Sun, 15 Sep 2024 21:40:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91D1D1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EDE860878
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dyeZN92Cwum for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ABF16089F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ABF16089F
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6485883682; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 10:02:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e15ee604ca308068eca4c9541e8fbfea528f0db4
X-Git-Newrev: 8edcea26649195e52c078a6bfe45d3fac15c1d19
X-Patchwork-Hint: ignore
Message-Id: <20240915213639.6485883682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-engineio: bump to version
 4.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8edcea26649195e52c078a6bfe45d3fac15c1d19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-simple-websocket runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-engineio/Config.in            | 1 +
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/Config.in b/package/python-engineio/Config.in
index b42b609e0d..9b9849ac48 100644
--- a/package/python-engineio/Config.in
+++ b/package/python-engineio/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_ENGINEIO
 	bool "python-engineio"
+	select BR2_PACKAGE_PYTHON_SIMPLE_WEBSOCKET # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  Engine.IO server.
diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index c1b02350bc..61c0dfe47f 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  619e7fce0257a8219187f50aa94844a3  python-engineio-4.8.2.tar.gz
-sha256  f8609e3afdda318fdc336b4ba2de8dd397bb8f9b8a1b43e56c27330e32c2e34c  python-engineio-4.8.2.tar.gz
+md5  3d1aa3e72ff50c1d779f6a6f543a438a  python_engineio-4.9.1.tar.gz
+sha256  7631cf5563086076611e494c643b3fa93dd3a854634b5488be0bba0ef9b99709  python_engineio-4.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 67092402b4..d291364705 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.8.2
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/e2/24/4a69dd119d10e31c4439f910a2a0f71b540b9f835ab60efa1f0f7bcae0c7
+PYTHON_ENGINEIO_VERSION = 4.9.1
+PYTHON_ENGINEIO_SOURCE = python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/50/01/94faf505820f1fb94133a456dad87a76df589f6999de563229a342e412fa
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
