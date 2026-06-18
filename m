Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB95BCD98E4
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABB288619B;
	Sat, 20 Jun 2026 09:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mz0FfmXR8bLA; Sat, 20 Jun 2026 09:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32210861C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946407;
	bh=55H8DJw2EiiNTV//oQTEQEN7sUG+LD4TvwT4ZqkWweg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZhsfhLAE/jHktT4ObyYVc1GYJw/dUBTneCAf+QjAKpC0pAiat7GiDnCTxTCV1FxD9
	 Pk89NbESfPPVoBTAr3QYvvQqRUqLSODflQl2URIEjfMoD04/GBZMrjz6Ty2NIGFdct
	 YLeDEqOKW6GEzlqscaJeA90yQThdiseV9Pc5DJ7yBUptWKucZ0esCEuBfPuPM+XwF3
	 slONrTO31ESqJTyBcnNNI+LF2jHgbT0dfY3Wrn0vZZdPXRyBBlqjNO9xUKqvS6k6VI
	 Sh+RgvCVKWZuWdmCHmOLlM7BK0XWhApMBKk4tkTyJyy8ldYxXbfcUs6MAIOLgInlUb
	 2p5q3s1P7ueqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32210861C8;
	Sat, 20 Jun 2026 09:06:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3C09367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C98C16FAB9
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qIB1tX2cp5ac for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD3746FABF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD3746FABF
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9ADA81E3E; Sat, 20 Jun 2026 09:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:38:26 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 313414b92c2501a2bc123ffa1b6383dca464de05
X-Git-Newrev: 8b916532b38b6b8e9d1763afc6ff54ef4b55fc7d
X-Patchwork-Hint: ignore
Message-Id: <20260620090614.C9ADA81E3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/redis: security
 bump to v8.6.4
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b916532b38b6b8e9d1763afc6ff54ef4b55fc7d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
(cherry picked from commit be7b7821c665db35beea8763c50a49da76bef1f5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
