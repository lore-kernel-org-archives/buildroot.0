Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63B5CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 927A48175B;
	Sun, 22 Sep 2024 10:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vT_2Qoy1UGx; Sun, 22 Sep 2024 10:35:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E75E81762
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E75E81762;
	Sun, 22 Sep 2024 10:35:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 259261BF870
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6102402A7
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prRVKWG2HRrI for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5578400CF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5578400CF
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87B1C814C4; Sun, 22 Sep 2024 10:34:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:37:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be0a54e1ac56cc3907a08d1a71218e39d38b88e1
X-Git-Newrev: 06a708ed26381b07299db93524894f02eb8d899e
X-Patchwork-Hint: ignore
Message-Id: <20240922103440.87B1C814C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sockjs: bump to version
 0.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=06a708ed26381b07299db93524894f02eb8d899e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-async-timeout runtime dependency.

License file renamed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-sockjs/Config.in          | 1 +
 package/python-sockjs/python-sockjs.hash | 6 +++---
 package/python-sockjs/python-sockjs.mk   | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-sockjs/Config.in b/package/python-sockjs/Config.in
index 92489ec71f..12346217c7 100644
--- a/package/python-sockjs/Config.in
+++ b/package/python-sockjs/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_SOCKJS
 	bool "python-sockjs"
 	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	help
 	  SockJS server implementation for aiohttp.
 
diff --git a/package/python-sockjs/python-sockjs.hash b/package/python-sockjs/python-sockjs.hash
index 137b54a89d..30a4ae1072 100644
--- a/package/python-sockjs/python-sockjs.hash
+++ b/package/python-sockjs/python-sockjs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sockjs/json
-md5  e28c1a82aa84c3994817905090abb169  sockjs-0.11.0.tar.gz
-sha256  0347d404ed9ef3196506787ed8018f87ee4e2d0baea49d420cdd53a969bec229  sockjs-0.11.0.tar.gz
+md5  0d35a367e2e82644112d6070d867bf7c  sockjs-0.13.0.tar.gz
+sha256  57e959a23f20a8d55149d1e5db0b3b870726f2b4ad8166d41bdcf411b36cdf76  sockjs-0.13.0.tar.gz
 # Locally computed sha256 checksums
-sha256  7be23c071df0314fadeba6077a3830340a5121ad88bfa66b0c095051a766e141  LICENSE.txt
+sha256  7be23c071df0314fadeba6077a3830340a5121ad88bfa66b0c095051a766e141  LICENSE
diff --git a/package/python-sockjs/python-sockjs.mk b/package/python-sockjs/python-sockjs.mk
index 0aea63f934..d9cfaf58ff 100644
--- a/package/python-sockjs/python-sockjs.mk
+++ b/package/python-sockjs/python-sockjs.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_SOCKJS_VERSION = 0.11.0
+PYTHON_SOCKJS_VERSION = 0.13.0
 PYTHON_SOCKJS_SOURCE = sockjs-$(PYTHON_SOCKJS_VERSION).tar.gz
-PYTHON_SOCKJS_SITE = https://files.pythonhosted.org/packages/88/e9/af7b321f70325fd2af3941aa147efd097156150da635e09efc7ccf70e54d
+PYTHON_SOCKJS_SITE = https://files.pythonhosted.org/packages/00/a4/644d5901d51aecb9fff218bbfc2525ef9362d4d03c2fcb8cb322aa0ce77f
 PYTHON_SOCKJS_SETUP_TYPE = setuptools
 PYTHON_SOCKJS_LICENSE = Apache-2.0
-PYTHON_SOCKJS_LICENSE_FILES = LICENSE.txt
+PYTHON_SOCKJS_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
