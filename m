Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6F5CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01DE4842C0;
	Sun,  3 May 2026 14:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fc0JOpnKNadh; Sun,  3 May 2026 14:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE6B84237
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819879;
	bh=CiVHcmFuJ85JkmUTIptIU/OPnKyZkvYtCt6GGfWX4KA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SSQKU6ZqvkAw9Ct5/doxdv/PTJjQNPNbAgCCo/o52SuKcrdRDhc2Gp2kANVpeUFQ1
	 OzvYlIQXqxk1PoWcxIrExYFhOtIUQkkCWhePhEyNI53aUFxdIAmUFDx/5kUiN9A5hA
	 ERT4OW1XUR9nZQLR+cGpQCfviYawy5587ev3zlTm0eug2NxEdI230soIVMAG/jaQnx
	 p26fO9+uWxaXLPA9jMiEvRpmp9TePLiX8sd9cTqZU/RUHgnEZ11ilTJxoOqs0fEutu
	 6mcq90xuOzDXOrBcAOMprkrK2CJB0GCz1AMeVXisu/rLGfBcAnwbIBpHOCfaJO0LGU
	 da5mS8k2vu+bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CE6B84237;
	Sun,  3 May 2026 14:51:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DFAE190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D154E84251
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9iSxCCOTBTRp for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06DC98425C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06DC98425C
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B80B283FAE; Sun,  3 May 2026 14:50:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6566823d4d7f8836cf03506c865684a96d0283aa
X-Git-Newrev: fb26e15fe7fcc04bf4404f23481023e3a24c4cb7
X-Patchwork-Hint: ignore
Message-Id: <20260503145043.B80B283FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-redis: bump version to 7.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fb26e15fe7fcc04bf4404f23481023e3a24c4cb7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/redis/redis-py/releases/tag/v7.4.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index ac284e56f0..583cb74bfd 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  fbec5721d85318b31ba62d11e4b08022  redis-7.3.0.tar.gz
-sha256  4d1b768aafcf41b01022410b3cc4f15a07d9b3d6fe0c66fc967da2c88e551034  redis-7.3.0.tar.gz
+md5  f7c1c7b3f4d163d2d424150d0498a35b  redis-7.4.0.tar.gz
+sha256  64a6ea7bf567ad43c964d2c30d82853f8df927c5c9017766c55a1d1ed95d18ad  redis-7.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index ca2e165948..21dd6f1994 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 7.3.0
+PYTHON_REDIS_VERSION = 7.4.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/da/82/4d1a5279f6c1251d3d2a603a798a1137c657de9b12cfc1fba4858232c4d2
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/7b/7f/3759b1d0d72b7c92f0d70ffd9dc962b7b7b5ee74e135f9d7d8ab06b8a318
 PYTHON_REDIS_SETUP_TYPE = hatch
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
