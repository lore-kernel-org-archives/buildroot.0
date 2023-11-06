Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57FCC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA5E4159D;
	Mon,  6 Nov 2023 22:03:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FA5E4159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gUYIXR-zOk-J; Mon,  6 Nov 2023 22:03:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 882A541579;
	Mon,  6 Nov 2023 22:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 882A541579
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70B001BF947
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56EDF612CC
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56EDF612CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5hZIgFT4n7d for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87605612C2
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87605612C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 756EE86B32; Mon,  6 Nov 2023 22:02:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 23:00:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29181f711acde2e0b597a64d3b4ecdaf063f64a8
X-Git-Newrev: 67df8af1da528c4b393d5929f51455aa6d31d2bd
X-Patchwork-Hint: ignore
Message-Id: <20231106220204.756EE86B32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-channels-redis: bump to
 version 4.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=67df8af1da528c4b393d5929f51455aa6d31d2bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace python-aioredis runtime dependency with python-redis.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-channels-redis/Config.in                  | 2 +-
 package/python-channels-redis/python-channels-redis.hash | 4 ++--
 package/python-channels-redis/python-channels-redis.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-channels-redis/Config.in b/package/python-channels-redis/Config.in
index d25f8ffe31..785b05cac0 100644
--- a/package/python-channels-redis/Config.in
+++ b/package/python-channels-redis/Config.in
@@ -2,10 +2,10 @@ config BR2_PACKAGE_PYTHON_CHANNELS_REDIS
 	bool "python-channels-redis"
 	# python-channels -> python-daphne -> python-autobahn -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	select BR2_PACKAGE_PYTHON_AIOREDIS # runtime
 	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
 	select BR2_PACKAGE_PYTHON_CHANNELS # runtime
 	select BR2_PACKAGE_PYTHON_MSGPACK # runtime
+	select BR2_PACKAGE_PYTHON_REDIS # runtime
 	help
 	  A Django Channels channel layer that uses Redis as its
 	  backing store, and supports both a single-server and
diff --git a/package/python-channels-redis/python-channels-redis.hash b/package/python-channels-redis/python-channels-redis.hash
index eaab5814a6..943712b3fd 100644
--- a/package/python-channels-redis/python-channels-redis.hash
+++ b/package/python-channels-redis/python-channels-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels-redis/json
-md5  82898cb3b50bb19e8484b80b4d940910  channels_redis-4.0.0.tar.gz
-sha256  122414f29f525f7b9e0c9d59cdcfc4dc1b0eecba16fbb6a1c23f1d9b58f49dcb  channels_redis-4.0.0.tar.gz
+md5  a184dded3478e618735a42174c334565  channels_redis-4.1.0.tar.gz
+sha256  6bd4f75f4ab4a7db17cee495593ace886d7e914c66f8214a1f247ff6659c073a  channels_redis-4.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels-redis/python-channels-redis.mk b/package/python-channels-redis/python-channels-redis.mk
index 727f403aaf..9186f07f17 100644
--- a/package/python-channels-redis/python-channels-redis.mk
+++ b/package/python-channels-redis/python-channels-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_REDIS_VERSION = 4.0.0
+PYTHON_CHANNELS_REDIS_VERSION = 4.1.0
 PYTHON_CHANNELS_REDIS_SOURCE = channels_redis-$(PYTHON_CHANNELS_REDIS_VERSION).tar.gz
-PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/8a/8d/bf96c62e3ca6c5ae59eb3482804afbe026c1c98b05b3ab65a0d46663644a
+PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/5b/3b/941efa8e337c3537475926fbf86e8cfe38a919e0f60bb9538b1cff364b8d
 PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
