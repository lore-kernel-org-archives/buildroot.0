Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE08C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A96F615D6;
	Thu,  4 Jan 2024 21:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A96F615D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A7l9wSXQf_AL; Thu,  4 Jan 2024 21:36:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFD5161B2F;
	Thu,  4 Jan 2024 21:36:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFD5161B2F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5EB6B1BF859
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3510D402EB
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3510D402EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bb6g9vbl7IAV for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:35:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1B32402A8
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1B32402A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D64038409E; Thu,  4 Jan 2024 21:35:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:35:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 206a9c11ac09d4264539b11ed0d45e6089d001a1
X-Git-Newrev: 7ff27f44ac6d3b01826819ec5c3ebabee6314e91
X-Patchwork-Hint: ignore
Message-Id: <20240104213553.D64038409E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiomonitor: bump to version
 0.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ff27f44ac6d3b01826819ec5c3ebabee6314e91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new runtime dependencies:
 - python-attrs
 - python-aiohttp
 - python-click
 - python-janus
 - python-trafaret
 - python-typing-extensions
 - python-prompt-toolkit

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiomonitor/Config.in              | 10 +++++++++-
 package/python-aiomonitor/python-aiomonitor.hash |  4 ++--
 package/python-aiomonitor/python-aiomonitor.mk   |  4 ++--
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/python-aiomonitor/Config.in b/package/python-aiomonitor/Config.in
index 435900ae32..9f3787f9b3 100644
--- a/package/python-aiomonitor/Config.in
+++ b/package/python-aiomonitor/Config.in
@@ -1,7 +1,15 @@
 config BR2_PACKAGE_PYTHON_AIOMONITOR
 	bool "python-aiomonitor"
-	select BR2_PACKAGE_PYTHON_TERMINALTABLES # runtime
 	select BR2_PACKAGE_PYTHON_AIOCONSOLE # runtime
+	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_JANUS # runtime
+	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
+	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
+	select BR2_PACKAGE_PYTHON_TERMINALTABLES # runtime
+	select BR2_PACKAGE_PYTHON_TRAFARET # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  aiomonitor adds monitor and python REPL capabilities for
 	  asyncio application.
diff --git a/package/python-aiomonitor/python-aiomonitor.hash b/package/python-aiomonitor/python-aiomonitor.hash
index b67d68e478..f1c0e37667 100644
--- a/package/python-aiomonitor/python-aiomonitor.hash
+++ b/package/python-aiomonitor/python-aiomonitor.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiomonitor/json
-md5  0f786c8278a68e7df8b24317e7d33271  aiomonitor-0.6.0.tar.gz
-sha256  31d30d1e9c0a23926edba2a2242b8572c6e8639af9aae2692dee863064d27e48  aiomonitor-0.6.0.tar.gz
+md5  75fc8f84c0ff385931d76c46265cfc0d  aiomonitor-0.7.0.tar.gz
+sha256  109b9ad309a44c0c5db1219d106f4062615151ad3f0e288a0c104fbb004d0398  aiomonitor-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  98397c300949e0cc1ddc68b0e48e67b10f2d0a4ffada4903d891a1315fe04156  LICENSE
diff --git a/package/python-aiomonitor/python-aiomonitor.mk b/package/python-aiomonitor/python-aiomonitor.mk
index 1a3b999b90..8eaddcbfa6 100644
--- a/package/python-aiomonitor/python-aiomonitor.mk
+++ b/package/python-aiomonitor/python-aiomonitor.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOMONITOR_VERSION = 0.6.0
+PYTHON_AIOMONITOR_VERSION = 0.7.0
 PYTHON_AIOMONITOR_SOURCE = aiomonitor-$(PYTHON_AIOMONITOR_VERSION).tar.gz
-PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/13/ab/36fbaf36c1c7cb4d5a81b945faf69e95a48dd38cbc9b57915d41d9445f55
+PYTHON_AIOMONITOR_SITE = https://files.pythonhosted.org/packages/50/30/1d903b716489c2b5d0a92baccf172f972e97c2de94d4ea41c154287e9b60
 PYTHON_AIOMONITOR_SETUP_TYPE = setuptools
 PYTHON_AIOMONITOR_LICENSE = Apache-2.0
 PYTHON_AIOMONITOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
