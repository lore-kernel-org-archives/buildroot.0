Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10007D5B171
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0CCB408F2;
	Sun, 14 Dec 2025 17:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oOw-d6xkegnA; Sun, 14 Dec 2025 17:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E988040926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734476;
	bh=GJAVW1iWlI7f0KsyZTzKromVUyRpNPeVKacLHZ5MFHA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MDtkWCe9mhNXTMOpH87Q70N5tBQVvvBjulzYahErCmEec0PpbhIUHnPBF+9ukz5cN
	 6aJOVTD6l7B9C5Bjgzy/Zhz8FmiuPybHOfC8agZ9Jv3kgmq50NvhA6LYmRQp9hsALk
	 7JtgrHxDCnHHPlcCnz/qRpBtn1L4tD3LRLr1D/PV0Xm6yTwd91V5pb2hyn7J9tEz4+
	 F+Z3eCw23Sop2878wMR9DdwdJSBgwdptG2wtTlUaY/X4mfmsdZqSdJYHgI4n41FgQa
	 TBfQ1n2dqVDrspYtC7RqDME5B/PoDKtkLl0iw3f0bqY5fpqL/8nQ6Rl9cdQNVYIO1V
	 k6/hi6EzfHvCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E988040926;
	Sun, 14 Dec 2025 17:47:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C6709117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF31660B02
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-btierF4EoZ for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A82760B55
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A82760B55
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A36786E96; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce223fb2e45e403b6e5faadc91b672a10e5befbc
X-Git-Newrev: f13bdc0120c2cd1df4f78dd78a06ca57ee5128c6
X-Patchwork-Hint: ignore
Message-Id: <20251214174743.0A36786E96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-beniget: bump version to
 0.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f13bdc0120c2cd1df4f78dd78a06ca57ee5128c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/serge-sans-paille/beniget/commits/0.5.0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-beniget/python-beniget.hash | 6 +++---
 package/python-beniget/python-beniget.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-beniget/python-beniget.hash b/package/python-beniget/python-beniget.hash
index 20f5d4ca6c..0da4ed7c1b 100644
--- a/package/python-beniget/python-beniget.hash
+++ b/package/python-beniget/python-beniget.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/beniget/json
-md5  f49610696dd4682006f63e6cf4b7ddc8  beniget-0.4.2.post1.tar.gz
-sha256  a0258537e65e7e14ec33a86802f865a667f949bb6c73646d55e42f7c45a052ae  beniget-0.4.2.post1.tar.gz
+md5  5bebc60d33a1b7daa4b3b27d3d1e50ed  beniget-0.5.0.tar.gz
+sha256  e7af11fa8ec7de3d3eb3d98b1e722d15d44017d8b35d8aa11d54f6719b312f22  beniget-0.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  64ad3e304e9d2d8731c26ac3e652335a6016e38be2f71fe30350be51c6d500b0  LICENSE
+sha256  e0b021e890014fff3f0eca73233f1317ca940ba56f085a644665771361ce4b9f  LICENSE
diff --git a/package/python-beniget/python-beniget.mk b/package/python-beniget/python-beniget.mk
index 53c5d70b5a..33d7c03401 100644
--- a/package/python-beniget/python-beniget.mk
+++ b/package/python-beniget/python-beniget.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BENIGET_VERSION = 0.4.2.post1
+PYTHON_BENIGET_VERSION = 0.5.0
 PYTHON_BENIGET_SOURCE = beniget-$(PYTHON_BENIGET_VERSION).tar.gz
-PYTHON_BENIGET_SITE = https://files.pythonhosted.org/packages/2e/27/5bb01af8f2860d431b98d0721b96ff2cea979106cae3f2d093ec74f6400c
+PYTHON_BENIGET_SITE = https://files.pythonhosted.org/packages/31/a9/cf7c2317da1f5034fdebe84555e14a474b3297ef2d03ad148ff02fef2e3a
 PYTHON_BENIGET_SETUP_TYPE = setuptools
 PYTHON_BENIGET_LICENSE = BSD-3-Clause
 PYTHON_BENIGET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
