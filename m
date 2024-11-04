Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDFFD1BDED
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD9524031B;
	Mon,  4 Nov 2024 20:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ch-DrC0RV7m4; Mon,  4 Nov 2024 20:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A42B40521
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A42B40521;
	Mon,  4 Nov 2024 20:42:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 211D1962
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C4784030B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7y5mDCHbBKm6 for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0FC54031B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0FC54031B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD42F84CC9; Mon,  4 Nov 2024 20:42:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 21:39:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbceaab49594c3eb0bcaf9f8ec197fa23ced1127
X-Git-Newrev: 5a722626d77be3c6d38da474cbb43262abc355b7
X-Patchwork-Hint: ignore
Message-Id: <20241104204204.CD42F84CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-janus: bump to version 1.1.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5a722626d77be3c6d38da474cbb43262abc355b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-janus/Config.in         | 1 -
 package/python-janus/python-janus.hash | 4 ++--
 package/python-janus/python-janus.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-janus/Config.in b/package/python-janus/Config.in
index 924c1fa97d..1b23653f76 100644
--- a/package/python-janus/Config.in
+++ b/package/python-janus/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_JANUS
 	bool "python-janus"
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Mixed sync-async queue to interoperate between asyncio
 	  tasks and classic threads.
diff --git a/package/python-janus/python-janus.hash b/package/python-janus/python-janus.hash
index 7f7ce35caa..9cdf8fdde7 100644
--- a/package/python-janus/python-janus.hash
+++ b/package/python-janus/python-janus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/janus/json
-md5  2d8c0b884c14f18fc5223858eb16461e  janus-1.0.0.tar.gz
-sha256  df976f2cdcfb034b147a2d51edfc34ff6bfb12d4e2643d3ad0e10de058cb1612  janus-1.0.0.tar.gz
+md5  0e3053f8b41e447e3cabed4075ac9116  janus-1.1.0.tar.gz
+sha256  0634df8b2b31f8afda4311abcf7fea912686fef717d13769eeaa01ae08d2b84c  janus-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8b177cccb6ddec12a9fc97bd49e7e2bbcd92464625624bd8bdbfad799ae606e9  LICENSE
diff --git a/package/python-janus/python-janus.mk b/package/python-janus/python-janus.mk
index 43df87870d..a6cbfc86db 100644
--- a/package/python-janus/python-janus.mk
+++ b/package/python-janus/python-janus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JANUS_VERSION = 1.0.0
+PYTHON_JANUS_VERSION = 1.1.0
 PYTHON_JANUS_SOURCE = janus-$(PYTHON_JANUS_VERSION).tar.gz
-PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/b8/a8/facab7275d7d3d2032f375843fe46fad1cfa604a108b5a238638d4615bdc
+PYTHON_JANUS_SITE = https://files.pythonhosted.org/packages/45/50/112a19f28a11b545c4c95de29c50a06fa9381a2432eaabbf9316bbd4e046
 PYTHON_JANUS_SETUP_TYPE = setuptools
 PYTHON_JANUS_LICENSE = Apache-2.0
 PYTHON_JANUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
