Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BF0F436B9
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B5CF60E57;
	Fri, 17 Apr 2026 15:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhUj9hCMOqtX; Fri, 17 Apr 2026 15:23:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3059E60E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439382;
	bh=um6Vdpz8XhwZmsoej5CWzFGPGkJ4LEjETBP6T3lumwE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dO8j4yG4TeNAG1bzuCepqaLuxGGZxxa7rYPICtTZ9Ba6YBjggUTy4cWEM8WpeCM75
	 5BtIfN69+VMWi0u4RrutQd0VpY7D6W/nso5MmoEMLgTE5rKG1dOAc47mcsNfriH5E5
	 SOLTs30W4rrv6k+NqrUU+RRsT26H7ylU3RumV1RCgFx9k+l1jxa7iV3lHn+911ujzB
	 8UyyB3V31o/ud2VSNUDT9cdEMAehjRzu9l00ZuDN7cBgAfq+4/TCjLxlkDJpgDppWK
	 KqIhBA1YvtzZ/S1R58KL/p/Cw8elc6lW+AuF6MkvUXrxkZ0Z9331N2TUhly4PIyw0C
	 ps6lmHIzRt2sA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3059E60E65;
	Fri, 17 Apr 2026 15:23:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC80A396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA77340DF1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvW2eI_Bd2uS for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D15740DF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D15740DF2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:22:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B177681DD5; Fri, 17 Apr 2026 15:22:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:21:15 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: f7ea0c8aa063e8b679dec884f5defc950e38f6aa
X-Git-Newrev: fc8111fcd1f71d609624acb95f899ac72b265cc4
X-Patchwork-Hint: ignore
Message-Id: <20260417152246.B177681DD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/redis: security
 bump to v8.4.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc8111fcd1f71d609624acb95f899ac72b265cc4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

See the release notes:
https://github.com/redis/redis/blob/8.4.2/00-RELEASENOTES

================================================================================
Redis 8.4.2    Released Mon 23 Feb 2026 10:00:00 IST
================================================================================

SECURITY: There is a security fix in the release

- A user can manipulate data read by a connection by injecting \r\n sequences
  into a Redis error reply

================================================================================
Redis 8.4.1    Released Sun 8 Feb 2026 9:00:00 IST
================================================================================

Update urgency: `SECURITY`: There are security fixes in the release.

- #T1837, #J1474 Hide Personally Identifiable Information from server log
- #P936 Cuckoo filter: crash on RDB load on 0 buckets (MOD-11593)
- #P945 Bloom filter: crash on RDB load on large number of filters (MOD-11590)

(And a whole lot of other bugfixes)

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 29a49271574095fb813ce7896c630a6e5fd78764)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 1ac1b1764d..e690dd1eaa 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  ca909aa15252f2ecb3a048cd086469827d636bf8334f50bb94d03fba4bfc56e8  redis-8.4.0.tar.gz
+sha256  0e7c150919e10c630d6e806fa7e65ce12aa90ddd0805e459b7da64ee65892805  redis-8.4.2.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 36a13a34ef..fb166b6f49 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.4.0
+REDIS_VERSION = 8.4.2
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
