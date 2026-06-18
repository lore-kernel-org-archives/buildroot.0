Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF04ACDB466
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD36B86184;
	Sat, 20 Jun 2026 09:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYgS6TT50HlS; Sat, 20 Jun 2026 09:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A0188618D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946395;
	bh=q3/FyHbDRRLi0Dl8hZs74bt7ZD5jO1uwB8ULjPd7ee4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F74/7nAUJc/XXY6MxVK2RWCpKcr7Oxg1OHEEExGVcgJappH0XZVPCF19CySD/H1ZM
	 S0LsJ+ABo2PMHADosLxki3tWk6eWGoBCsEfoU6/8E7+L3uK/l7Zaia4TOLJmuF9+DA
	 mtY2KwP2aFc8oavbTSc++Cadi765XOoEYT2C3QlIn2tKOAHgU5rV1590WztCMA20Nk
	 ZMM84q94BigMsgm9ekBEyhrGpwEXKldTy2uepr6DmeoxVNfOTDytDPSEJ5TX2hyZUH
	 ZmnqeVMKvbRzcA4Sf1lefpu/uY5sKhgtLmh+DH1nrjOT5c/8sMlAr1ccji6cMoJZT/
	 phTkfE5RZAhTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A0188618D;
	Sat, 20 Jun 2026 09:06:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13112112A
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0506441A48
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYwA2-o7McAl for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2EE240875
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2EE240875
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A67B281E3E; Sat, 20 Jun 2026 09:06:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:39:32 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c49ae7216786d3cb62a8e8de5556007b4b539233
X-Git-Newrev: ef4ba987c5c24e8bcbb50d499cabdcf7511f74c3
X-Patchwork-Hint: ignore
Message-Id: <20260620090607.A67B281E3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/redis: security
 bump to v7.2.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef4ba987c5c24e8bcbb50d499cabdcf7511f74c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes:
https://github.com/redis/redis/blob/7.2.14/00-RELEASENOTES

This fixes the following vulnerabilites:
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

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit be7b7821c665db35beea8763c50a49da76bef1f5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 9e5be53969..055276a270 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  b3eeef15ea90a41c568f1f97a78d3370400baad55566869bbbf1af9f9106d85c  redis-7.2.13.tar.gz
+sha256  21326da3f66c0aead4c8204c0ac52ff905337a77cadd169f75ac22835ea30025  redis-7.2.14.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index b9702eb6e0..62f70b352b 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.13
+REDIS_VERSION = 7.2.14
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
