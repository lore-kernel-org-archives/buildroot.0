Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC8BF3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5257261356;
	Sun, 15 Mar 2026 22:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OPqRB54fbu1g; Sun, 15 Mar 2026 22:19:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 690DD61366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613154;
	bh=jyG7LxekWM181Ns7xOgFo8IjOFShtzJN7UILIL/M8YA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LP2224MrfvE8kAlBydUu2BZwwcEltBg9r9VMOPHnlb+5cXuxuNpIUnBYDY8wwrPf/
	 OSKNBJqEUyC2iRElvB/qWFF/B/bjEPdg/NW7ZInRFdqWFcZPVv0xwWpnAd78/4eW0b
	 b6MomSbaG0PHlK7Lc/X68t/j/4Z3TZlV3ln9CtrXm6h+OAob27tt9cAY0Mm86FQrJr
	 +ZSNtiqSi3fGCZxvlTplaCr/5BEfJw3uMSFst3iMAdk7vcKViBnXFA6eLTkEkNxL9Y
	 LCwq16rHIAYCZ1RTK4yc/XlJkhfAAQP+lG8bmv6ww4MFxIB2zkmt0fZ7UcWaE0v2m1
	 fKfJzTUhA4cOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 690DD61366;
	Sun, 15 Mar 2026 22:19:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0437A1B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A00E6108D
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5dLhkJe1v1e for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F0BD6109D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F0BD6109D
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0FEC85C3A; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a98fb01c098376c5b5703cd477f16c04203602cb
X-Git-Newrev: 8c4e2c944ff43e7d28e930332251956f35f40a80
X-Patchwork-Hint: ignore
Message-Id: <20260315221803.C0FEC85C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-redis: bump version to 7.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c4e2c944ff43e7d28e930332251956f35f40a80
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/redis/redis-py/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 007c1d79a8..ac284e56f0 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  cd185322335c0842a457bde1daf87fd0  redis-7.1.0.tar.gz
-sha256  b1cc3cfa5a2cb9c2ab3ba700864fb0ad75617b41f01352ce5779dabf6d5f9c3c  redis-7.1.0.tar.gz
+md5  fbec5721d85318b31ba62d11e4b08022  redis-7.3.0.tar.gz
+sha256  4d1b768aafcf41b01022410b3cc4f15a07d9b3d6fe0c66fc967da2c88e551034  redis-7.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index a8d58c94c5..ca2e165948 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 7.1.0
+PYTHON_REDIS_VERSION = 7.3.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/43/c8/983d5c6579a411d8a99bc5823cc5712768859b5ce2c8afe1a65b37832c81
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/da/82/4d1a5279f6c1251d3d2a603a798a1137c657de9b12cfc1fba4858232c4d2
 PYTHON_REDIS_SETUP_TYPE = hatch
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
