Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A23BFC6179
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C532640773;
	Sat,  3 Jan 2026 11:41:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozGRUkcU1oLN; Sat,  3 Jan 2026 11:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E31D640779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767440464;
	bh=1FjevgZ9UpPsWNP/9Apm2jpJXaETYQausd32gXbK1ls=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UiKoew5Dg/budhn7x86NXU7W1R1JscPIkJj73vGKiN/PIac6OGeDf8GHZERrJ3Ka0
	 klZCQx2Q6vrgMbM5HJ7Wyn43YeplPfMk8TOJBFPLyA3lwAW7u7M3tr4hm4xgqUV1cN
	 dphJXr5b8rA3003d/WDgBw67mPMsl/LeDp3barcZ0oxKPhUb/j6Tu/V3Jf/X2zAha/
	 qDRHKlax0+Dfiycp93vdUtURCBhRCXXwe4mTkzB7JsY9uFCmIKpk5MbBnfZesOWCRx
	 Ay4FjpiGkXG4cfctqnVIRe9UP1obR/twH/vZIs+ZkGqtgGzN4H47BvyEIKZBGWX4Hs
	 Wyi2iSwhLoOug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E31D640779;
	Sat,  3 Jan 2026 11:41:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 786DDA21
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EE0A40399
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCPCFEWGF6sa for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DC5B40359
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DC5B40359
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C47C88114; Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 12:31:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77e19aa8a2d38c32f99ad0a2a9eb096d75df9e8d
X-Git-Newrev: 9e92513e25ced434a3e5b3e4a6215bb794c4958d
X-Patchwork-Hint: ignore
Message-Id: <20260103114057.8C47C88114@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-channels-redis: bump to
 version 4.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e92513e25ced434a3e5b3e4a6215bb794c4958d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-channels-redis/python-channels-redis.hash | 4 ++--
 package/python-channels-redis/python-channels-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-channels-redis/python-channels-redis.hash b/package/python-channels-redis/python-channels-redis.hash
index 3fc82ebb5c..b6b65fd843 100644
--- a/package/python-channels-redis/python-channels-redis.hash
+++ b/package/python-channels-redis/python-channels-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels-redis/json
-md5  a6d2eafea6e44440bb30f0a62de5d089  channels_redis-4.2.1.tar.gz
-sha256  8375e81493e684792efe6e6eca60ef3d7782ef76c6664057d2e5c31e80d636dd  channels_redis-4.2.1.tar.gz
+md5  172d42f51bc62b92dbc218c59c9ebab7  channels_redis-4.3.0.tar.gz
+sha256  740ee7b54f0e28cf2264a940a24453d3f00526a96931f911fcb69228ef245dd2  channels_redis-4.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels-redis/python-channels-redis.mk b/package/python-channels-redis/python-channels-redis.mk
index f91e96c849..d651383127 100644
--- a/package/python-channels-redis/python-channels-redis.mk
+++ b/package/python-channels-redis/python-channels-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_REDIS_VERSION = 4.2.1
+PYTHON_CHANNELS_REDIS_VERSION = 4.3.0
 PYTHON_CHANNELS_REDIS_SOURCE = channels_redis-$(PYTHON_CHANNELS_REDIS_VERSION).tar.gz
-PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/c7/6d/c379c9feea4522cbdb4eba9b3d23a6270ba8cbd94e847b21834d898109d6
+PYTHON_CHANNELS_REDIS_SITE = https://files.pythonhosted.org/packages/ab/69/fd3407ad407a80e72ca53850eb7a4c306273e67d5bbb71a86d0e6d088439
 PYTHON_CHANNELS_REDIS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_REDIS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_REDIS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
