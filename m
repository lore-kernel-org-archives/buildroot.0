Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C514F3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26041416AA;
	Sun, 15 Mar 2026 22:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utBgtdULBmtr; Sun, 15 Mar 2026 22:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ADE6416B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613197;
	bh=BrwidtKMeN0+YUQdI8r2wEna4cvOBW6duOCr4P27T84=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IOQwC4tYcugHVNC4PGdG+aqkx9s1a0TOKKXNONkyzvUgKDSJpq7TpFc5hN/O4M/et
	 /zbIf2nsK/DRu1MflcXoLU0f3Bc5MbKTRbTJUifi3QibiOJF+ZoaNFp5V0rUk0sGwp
	 qqi+E8YsCuuabThjMjRKzuM5mlNshd/3AcwbpY4kr8J2cqrDDDSP2QglEl1l38jGfN
	 XktCFqqc3DYzwWUqt/dcvnmy7O6hAxRBAMX5xNCkhED6476/8VAfNkbXx4K+xiJBBf
	 hN5EJrVXFgPULFx8Vjjt+D1pvU4odnYoFQ6yoKLbStrlsqiZc80g0+ANpn8KJcsnas
	 ck5ZsiSH0zJTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ADE6416B6;
	Sun, 15 Mar 2026 22:19:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A36357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFB7C611AA
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gN4avDTiZ5Z5 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 570DA6108C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 570DA6108C
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 991D5839BB; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50c9c7f5536966d907c4c922c03834be53ec9446
X-Git-Newrev: 7ad3ec1c6fb0db80551b87802f1045391a37d169
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.991D5839BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tqdm: bump version to 4.67.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7ad3ec1c6fb0db80551b87802f1045391a37d169
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://tqdm.github.io/releases/

Updated license hash due to copyright year bump:
https://github.com/tqdm/tqdm/commit/a69dac84b3d2e7ab23dbfcccae29b28a753ee5eb

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-tqdm/python-tqdm.hash | 6 +++---
 package/python-tqdm/python-tqdm.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index 1395fa2e99..4bb81e11e7 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tqdm/json
-md5  aca803dd7ac5c4ae233977aff41b7f7c  tqdm-4.67.1.tar.gz
-sha256  f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2  tqdm-4.67.1.tar.gz
+md5  e1be20b64fdb913d2246c635cdf97b28  tqdm-4.67.3.tar.gz
+sha256  7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb  tqdm-4.67.3.tar.gz
 # Locally computed sha256 checksums
-sha256  dc33252e829015e3b150086fb9b3a40f6ad6fb32c2f4610ce812fa677d35986a  LICENCE
+sha256  fcff87c3a47ce8028a8512aa182d4fcf0ad1c90544ee75cf9b343684cac194de  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index b03e19ccda..df455973f4 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TQDM_VERSION = 4.67.1
+PYTHON_TQDM_VERSION = 4.67.3
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d
+PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
