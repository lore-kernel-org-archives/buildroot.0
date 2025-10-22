Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9BECCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A382283D43;
	Wed, 22 Oct 2025 16:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2h7aHT-W2MM4; Wed, 22 Oct 2025 16:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B931B83D67
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B931B83D67;
	Wed, 22 Oct 2025 16:53:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F50643F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20C02406C6
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xjczl82TDmOj for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44B7A40642
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44B7A40642
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:53:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B8118773F; Wed, 22 Oct 2025 16:53:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:52:01 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 951bac1e8ffb6fa038a5a651505815fc2bea30d7
X-Git-Newrev: fd41de56863f52e0075831b98edaa94e19d8c492
X-Patchwork-Hint: ignore
Message-Id: <20251022165301.2B8118773F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/redis: security
 bump to v7.2.11
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fd41de56863f52e0075831b98edaa94e19d8c492
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

See the release notes:
https://github.com/redis/redis/blob/7.2.11/00-RELEASENOTES

This fixes the following vulnerabilities (in the Lua scripting engine):
- CVE-2025-46817:
    Redis is an open source, in-memory database that persists on disk.
    Versions 8.2.1 and below allow an authenticated user to use a
    specially crafted Lua script to cause an integer overflow and
    potentially lead to remote code execution The problem exists in all
    versions of Redis with Lua scripting. This issue is fixed in version
    8.2.2.
    https://www.cve.org/CVERecord?id=CVE-2025-46817

- CVE-2025-46818:
    Redis is an open source, in-memory database that persists on disk.
    Versions 8.2.1 and below allow an authenticated user to use a
    specially crafted Lua script to manipulate different LUA objects and
    potentially run their own code in the context of another user. The
    problem exists in all versions of Redis with LUA scripting. This issue
    is fixed in version 8.2.2. A workaround to mitigate the problem
    without patching the redis-server executable is to prevent users from
    executing LUA scripts. This can be done using ACL to block a script by
    restricting both the EVAL and FUNCTION command families.
    https://www.cve.org/CVERecord?id=CVE-2025-46818

- CVE-2025-46819:
    Redis is an open source, in-memory database that persists on disk.
    Versions 8.2.1 and below allow an authenticated user to use a
    specially crafted LUA script to read out-of-bound data or crash the
    server and subsequent denial of service. The problem exists in all
    versions of Redis with Lua scripting. This issue is fixed in version
    8.2.2. To workaround this issue without patching the redis-server
    executable is to prevent users from executing Lua scripts. This can be
    done using ACL to block a script by restricting both the EVAL and
    FUNCTION command families.
    https://www.cve.org/CVERecord?id=CVE-2025-46819

- CVE-2025-49844:
    Redis is an open source, in-memory database that persists on disk.
    Versions 8.2.1 and below allow an authenticated user to use a
    specially crafted Lua script to manipulate the garbage collector,
    trigger a use-after-free and potentially lead to remote code
    execution. The problem exists in all versions of Redis with Lua
    scripting. This issue is fixed in version 8.2.2. To workaround this
    issue without patching the redis-server executable is to prevent users
    from executing Lua scripts. This can be done using ACL to restrict
    EVAL and EVALSHA commands.
    https://www.cve.org/CVERecord?id=CVE-2025-49844

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 630f6b6d76..aa3253335e 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  e576ad54bc53770649c556933ecd555b975e3dac422e46356102436a437b43c7  redis-7.2.10.tar.gz
+sha256  2f9886eca68d30114ad6a01da65631f8007d802fd3e6c9fac711251e6390323d  redis-7.2.11.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index a2d4fbe138..cd9736663b 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.10
+REDIS_VERSION = 7.2.11
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
