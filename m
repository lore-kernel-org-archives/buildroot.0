Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79C6FC6182
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 22:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8567F40352;
	Fri, 13 Sep 2024 22:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3Dt2ganbrle; Fri, 13 Sep 2024 22:22:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEA8D40355
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEA8D40355;
	Fri, 13 Sep 2024 22:22:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A2E141BF2BE
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F22980DAB
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRdmqoFrEdvP for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 22:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B656680D8E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B656680D8E
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 22:22:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BFA587037; Fri, 13 Sep 2024 22:22:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 00:19:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee67e4baffc8bb0577a265ad4ffe814acfad5397
X-Git-Newrev: 565e8e8d18792746373c5932d13acc8c68f6d95a
X-Patchwork-Hint: ignore
Message-Id: <20240913222217.9BFA587037@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohappyeyeballs: new
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

commit: https://git.buildroot.net/buildroot/commit/?id=565e8e8d18792746373c5932d13acc8c68f6d95a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                         |  1 +
 package/python-aiohappyeyeballs/Config.in                 |  6 ++++++
 .../python-aiohappyeyeballs/python-aiohappyeyeballs.hash  |  5 +++++
 .../python-aiohappyeyeballs/python-aiohappyeyeballs.mk    | 15 +++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 8f8f1ff8ee..4eccf77dd3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -970,6 +970,7 @@ menu "External python modules"
 	source "package/python-aioconsole/Config.in"
 	source "package/python-aiodns/Config.in"
 	source "package/python-aiofiles/Config.in"
+	source "package/python-aiohappyeyeballs/Config.in"
 	source "package/python-aiohttp/Config.in"
 	source "package/python-aiohttp-cors/Config.in"
 	source "package/python-aiohttp-debugtoolbar/Config.in"
diff --git a/package/python-aiohappyeyeballs/Config.in b/package/python-aiohappyeyeballs/Config.in
new file mode 100644
index 0000000000..86a998a7d6
--- /dev/null
+++ b/package/python-aiohappyeyeballs/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_AIOHAPPYEYEBALLS
+	bool "python-aiohappyeyeballs"
+	help
+	  Happy Eyeballs for asyncio.
+
+	  https://github.com/aio-libs/aiohappyeyeballs
diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
new file mode 100644
index 0000000000..c7b956238f
--- /dev/null
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiohappyeyeballs/json
+md5  3c9a696b2d2808a3a633743965415d4d  aiohappyeyeballs-2.4.0.tar.gz
+sha256  55a1714f084e63d49639800f95716da97a1f173d46a16dfcfda0016abb93b6b2  aiohappyeyeballs-2.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
new file mode 100644
index 0000000000..0d6abdf65e
--- /dev/null
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-aiohappyeyeballs
+#
+################################################################################
+
+PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.0
+PYTHON_AIOHAPPYEYEBALLS_SOURCE = aiohappyeyeballs-$(PYTHON_AIOHAPPYEYEBALLS_VERSION).tar.gz
+PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/2d/f7/22bba300a16fd1cad99da1a23793fe43963ee326d012fdf852d0b4035955
+PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = pep517
+PYTHON_AIOHAPPYEYEBALLS_LICENSE = PSF-2.0
+PYTHON_AIOHAPPYEYEBALLS_LICENSE_FILES = LICENSE
+PYTHON_AIOHAPPYEYEBALLS_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
