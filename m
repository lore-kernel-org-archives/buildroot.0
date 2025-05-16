Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBA7C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE3CA70DFF;
	Mon, 19 May 2025 11:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqPcyr7r0Jhs; Mon, 19 May 2025 11:00:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FEA670DFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FEA670DFA;
	Mon, 19 May 2025 11:00:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2303EE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFBB0417AB
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRcd1NcRJzWP for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 807AF419E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 807AF419E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7934C872E7; Mon, 19 May 2025 10:40:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:19:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c912dc1d27279d5fc6e4187d6c05bda7de7af040
X-Git-Newrev: 0468aae90a0124b79febf8705d9779e7a8a2ce4c
X-Patchwork-Hint: ignore
Message-Id: <20250519104004.7934C872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-anyio: bump to
 4.9.0
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0468aae90a0124b79febf8705d9779e7a8a2ce4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://github.com/agronholm/anyio/releases/tag/4.9.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/python-anyio/Config.in         | 1 -
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-anyio/Config.in b/package/python-anyio/Config.in
index 353c7e4629..d843f37af0 100644
--- a/package/python-anyio/Config.in
+++ b/package/python-anyio/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_ANYIO
 	bool "python-anyio"
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  High level compatibility layer for multiple asynchronous
 	  event loop implementations.
diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index 4ff6955ae5..e1fdf474c2 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  ad00874069a6685b2e3e84c5a2e045cb  anyio-4.8.0.tar.gz
-sha256  1d9fe889df5212298c0c0723fa20479d1b94883a2df44bd3897aa91083316f7a  anyio-4.8.0.tar.gz
+md5  d0e4db5f5e4041d1bc9664042b454218  anyio-4.9.0.tar.gz
+sha256  673c0c244e15788651a4ff38710fea9675823028a6f08a5eda409e0c9840a028  anyio-4.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 4f38e12794..3be3f2b78f 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.8.0
+PYTHON_ANYIO_VERSION = 4.9.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/a3/73/199a98fc2dae33535d6b8e8e6ec01f8c1d76c9adb096c6b7d64823038cde
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/95/7d/4c1bd541d4dffa1b52bd83fb8527089e097a106fc90b467a7313b105f840
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
