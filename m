Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B2ACD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 14:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9E77421C6;
	Tue,  9 Jun 2026 14:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BK8zG8HtpSFb; Tue,  9 Jun 2026 14:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9BE442275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781017045;
	bh=tJGAun+IdilJssnOiOrxTYLocw2UrCn1pqYjPWK8mz4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bc4nSDljHcZ5CbkygTgg0hlDY0cShziWXTdhPBSJ7HbYgPijipDs6w+Cb3JRHsplq
	 yarLbr80FFKCwWzdTb6pBzH0BCKJFo6EG44k8Yb/ZjF7IcY4TAOgMSUiCtgj0Ehsm9
	 8uq/nC8EHnyIt/FYsYiZ/us9mMLKed9fEoHaO210hWbHP592qPW0XJEhL9+ahSb08M
	 AgwFz9/bc0S7uThYlB+X3T8/2hwTZn1Zs5ogWJuJCXAmht2+sUmt/N0/RjT12XF+iI
	 aYvySNsunISBeWsnlmwR/1hzIv5+KpjQ14fuT3zwUU58DrwufjfGr5gaG0WKOyxX9z
	 ht2vWnmVo022w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9BE442275;
	Tue,  9 Jun 2026 14:57:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 773A62C1
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 14:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68D406F75F
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 14:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pjFp7jfo_EPM for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 14:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 873056F75E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 873056F75E
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 14:57:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A931E87E9D; Tue,  9 Jun 2026 14:57:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jun 2026 16:51:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7f2991ac3a09640702d5e120c2f7d46086302d9
X-Git-Newrev: be7b7821c665db35beea8763c50a49da76bef1f5
X-Patchwork-Hint: ignore
Message-Id: <20260609145704.A931E87E9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: security bump to v8.6.4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/be7b7821c665db35beea8763c50a49da76bef1f5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes:
https://github.com/redis/redis/blob/8.6.4/00-RELEASENOTES

This fixes the following vulnerabilities:
- CVE-2026-23479:
    Redis is an in-memory data structure store. In redis-server from 7.2.0
    until 8.6.3, the unblock client flow does not handle an error return
    from `processCommandAndResetClient` when re-executing a blocked
    command. If a blocked client is evicted during this flow, an
    authenticated attacker can trigger a use-after-free that may lead to
    remote code execution. This has been patched in version 8.6.3.
    https://www.cve.org/CVERecord?id=CVE-2026-23479

- CVE-2026-23631:
    Redis is an in-memory data structure store. In all versions of redis-
    server with Lua scripting, an authenticated attacker can exploit the
    master-replica synchronization mechanism to trigger a use-after-free
    on replicas where replica-read-only is disabled or can be disabled,
    which may lead to remote code execution. A workaround is to prevent
    users from executing Lua scripts or avoid using replicas where
    replica-read-only is disabled. This is patched in version 8.6.3.
    https://www.cve.org/CVERecord?id=CVE-2026-23631

- CVE-2026-25243:
    Redis is an in-memory data structure store. In versions of redis-
    server up to 8.6.3, the RESTORE command does not properly validate
    serialized values. An authenticated attacker with permission to
    execute RESTORE can supply a crafted serialized payload that triggers
    invalid memory access and may lead to remote code execution. A
    workaround is to restrict access to the RESTORE command with ACL
    rules. This is patched in version 8.6.3.
    https://www.cve.org/CVERecord?id=CVE-2026-25243

- CVE-2026-25588:
    RedisTimeSeries is a time-series module for Redis. In all versions
    before 1.12.14 of RedisTimeSeries, the module does not properly
    validate serialized values processed through the Redis RESTORE
    command. An authenticated attacker with permission to execute RESTORE
    on a server with the RedisTimeSeries module loaded can supply a
    crafted serialized payload that triggers invalid memory access and may
    lead to remote code execution. A workaround is to restrict access to
    the RESTORE command with ACL rules. This has been patched in version
    1.12.14.
    https://www.cve.org/CVERecord?id=CVE-2026-25588

- CVE-2026-25589:
    RedisBloom is a probabilistic data structures module for Redis. In all
    versions of RedisBloom before 2.8.20, the module does not properly
    validate serialized values processed through the Redis RESTORE
    command. An authenticated attacker with permission to execute RESTORE
    on a server with the RedisBloom module loaded can supply a crafted
    serialized payload that triggers invalid memory access and may lead to
    remote code execution. A workaround is to restrict access to the
    RESTORE command with ACL rules. This issue is fixed in version 2.8.20.
    https://www.cve.org/CVERecord?id=CVE-2026-25589

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 5e67e1a28c..2bbbc9e2a7 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  cea46526594fe05f05b9ff733179eb1263deccf4269059cf081fdef222634c88  redis-8.6.2.tar.gz
+sha256  559c2e50c496b2d4afcfb491af27763a1b170037317789ecf309025d0caece24  redis-8.6.4.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 9db7226675..ba41b3f922 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.6.2
+REDIS_VERSION = 8.6.4
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
