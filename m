Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FE7C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3F1940108;
	Mon,  5 Feb 2024 11:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3F1940108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HaxiT-Y43nf9; Mon,  5 Feb 2024 11:06:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0B5940ADD;
	Mon,  5 Feb 2024 11:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0B5940ADD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EA3F1BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8531E418A2
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8531E418A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOHN1Qm-VxV8 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A1184188F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A1184188F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5858086B6F; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:05:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cfd08bd302e7d2e3585ef4d25e448abec3c8453
X-Git-Newrev: 9ebe576da4e79dc5c71502385f9c080cee024f08
X-Patchwork-Hint: ignore
Message-Id: <20240205110640.5858086B6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-redis: bump to version 5.0.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ebe576da4e79dc5c71502385f9c080cee024f08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/redis/redis-py/commit/28cc65c18cc4fb37ef14497c963eb181dba8d25d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-redis/Config.in         | 4 ++--
 package/python-redis/python-redis.hash | 6 +++---
 package/python-redis/python-redis.mk   | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-redis/Config.in b/package/python-redis/Config.in
index 4143e1f1c1..e22959cf7b 100644
--- a/package/python-redis/Config.in
+++ b/package/python-redis/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_REDIS
 	bool "python-redis"
 	help
-	  Python client for Redis key-value store.
+	  Python client for Redis database and key-value store.
 
-	  https://github.com/andymccurdy/redis-py
+	  https://github.com/redis/redis-py
diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index e27f87bd50..2d9df87a10 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  ad365234df634680d15294ddc87c42de  redis-4.5.5.tar.gz
-sha256  dc87a0bdef6c8bfe1ef1e1c40be7034390c2ae02d92dcd0c7ca1729443899880  redis-4.5.5.tar.gz
+md5  f4bff9e3819ec832bb789b8b58363d6b  redis-5.0.1.tar.gz
+sha256  0dab495cd5753069d3bc650a0dde8a8f9edde16fc5691b689a566eda58100d0f  redis-5.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  7801a39e3a1aec58a7ea7c9f4dc1238cf0922c36a1fc8eff0bb7d684ff6dd354  LICENSE
+sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 186702dc83..067a754352 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 4.5.5
+PYTHON_REDIS_VERSION = 5.0.1
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/53/30/128c5599bc3fa61488866be0228326b3e486be34480126f70e572043adf8
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/4a/4c/3c3b766f4ecbb3f0bec91ef342ee98d179e040c25b6ecc99e510c2570f2a
 PYTHON_REDIS_SETUP_TYPE = setuptools
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
