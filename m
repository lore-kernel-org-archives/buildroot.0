Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60214D5B871
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E55240B12;
	Mon, 15 Dec 2025 21:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRuGB5u8SVhx; Mon, 15 Dec 2025 21:39:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CDA240B22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834746;
	bh=dCRwDslIrHXP2U/LIvQrEGt+fdKWtrredyfft7R/YJI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fcCj3IyYFNH4ELqMwgmIKvsPXbMlISl55ipC50BDp0PyXeUqyVyHF0z6bQlEaIzO+
	 z+QQm3jojUqP+bQzHlJQOx85u2716iZtQW34QsJKxDLHl8DKffwlM2nPeCDYtcn6vG
	 wIhqyF33IRbN9qcDPntW4PafHlxPOglFsYYRhxIxDYYn3IZzwQKb78hzAgElH1H2FI
	 9ylWvXLSEI3ZPT1O7X+I5wOQ8ZHMGAV3Gca8ffeUHsBb8GslnJXkHnQkdsgOodzCwG
	 XqvzMgu0CkfWIotF+6CmbCz1fa77qoV7NkMQMnsthiyYdHwbizoQjQaFh5mhogmCC+
	 xReFUoyTpNGQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CDA240B22;
	Mon, 15 Dec 2025 21:39:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DE8D151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E62940413
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EebP4FUo1Iyx for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2E1F40825
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2E1F40825
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C20CF86FC1; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:37:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cbc1023a4b255cc9af71a65da604502d1325f285
X-Git-Newrev: 29af58079b17ec3ce6669e0888ee30b4940fb8f7
X-Patchwork-Hint: ignore
Message-Id: <20251215213844.C20CF86FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-redis: bump version to 7.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=29af58079b17ec3ce6669e0888ee30b4940fb8f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/redis/redis-py/releases/

Switched setup type to hatch added upstream in version 6.0.0:
https://github.com/redis/redis-py/commit/483c021e88657ec045754537c3be3efc4d3a202c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index b6bee68ca2..007c1d79a8 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  6e57c67eab7537b789c7a0f4a3068510  redis-5.2.1.tar.gz
-sha256  16f2e22dff21d5125e8481515e386711a34cbec50f0e44413dd7d9c060a54e0f  redis-5.2.1.tar.gz
+md5  cd185322335c0842a457bde1daf87fd0  redis-7.1.0.tar.gz
+sha256  b1cc3cfa5a2cb9c2ab3ba700864fb0ad75617b41f01352ce5779dabf6d5f9c3c  redis-7.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index d02d4bd44b..a8d58c94c5 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 5.2.1
+PYTHON_REDIS_VERSION = 7.1.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/47/da/d283a37303a995cd36f8b92db85135153dc4f7a8e4441aa827721b442cfb
-PYTHON_REDIS_SETUP_TYPE = setuptools
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/43/c8/983d5c6579a411d8a99bc5823cc5712768859b5ce2c8afe1a65b37832c81
+PYTHON_REDIS_SETUP_TYPE = hatch
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
