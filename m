Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F710D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E679A60E24;
	Sun, 14 Dec 2025 21:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxqnTNa2MDjH; Sun, 14 Dec 2025 21:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 125C860E3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747324;
	bh=DNX9k8xgL5EkiIEarzgtUOdvcZMj0twvRm8yiwUdWXo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cNMRfRDovu/ZIB8elkui6b1esdwpysOKg481Hv/TGYe9VCZV+1IJZSHJfsSgWizof
	 N0UD7Etn6F1mXKGgj6yCLFK6PyglcEmM+AjW4I/cFMiOxlji3hPifcCXYbIDUDWIZK
	 nmauipeT2EDk0YRUhY57136M3fX5ZohgvTY7gg36odbZRjBFmY+VgRcsyoaVB73f3X
	 eynfXDgGPiw+eI+cu3tFrznpZFMVl/2p/4IVIyyjS5MzRfarp0CCTWDXAxkmdkZ8Gp
	 SZcVbj5GFsvyD0rbczrVVslTXjnyjNAbFo27X6TEB8XR9W28M72q85xGVST5DNoWhI
	 McdTwaxfP0JYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 125C860E3F;
	Sun, 14 Dec 2025 21:22:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 100AF2ED
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EFDF60DB9
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KpbwlieitfNm for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63D0560A5D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63D0560A5D
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62B1B7FF02; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ebf7e537998f8a1f44f3d373661cb0da83ea2a4
X-Git-Newrev: e546b31d88480d2e640600c1a0aee59e5d05e15c
X-Patchwork-Hint: ignore
Message-Id: <20251214212140.62B1B7FF02@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-api-core: bump
 version to 2.28.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e546b31d88480d2e640600c1a0aee59e5d05e15c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/googleapis/python-api-core/blob/v2.28.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index 16845addb4..9e3c732773 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  160d95edde90db1d72b6de58b673c993  google_api_core-2.26.0.tar.gz
-sha256  e6e6d78bd6cf757f4aee41dcc85b07f485fbb069d5daa3afb126defba1e91a62  google_api_core-2.26.0.tar.gz
+md5  fc633e6fd830f249f8dd205f10544660  google_api_core-2.28.1.tar.gz
+sha256  2b405df02d68e68ce0fbc138559e6036559e685159d148ae5861013dc201baf8  google_api_core-2.28.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index c88fb2ec28..908a37c3e4 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.26.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.28.1
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/32/ea/e7b6ac3c7b557b728c2d0181010548cbbdd338e9002513420c5a354fa8df
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/61/da/83d7043169ac2c8c7469f0e375610d78ae2160134bf1b80634c482fa079c
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
