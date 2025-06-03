Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305B2C5B552
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 20:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF40C83A56;
	Tue,  3 Jun 2025 20:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opoFasbeIoob; Tue,  3 Jun 2025 20:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE558212D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE558212D;
	Tue,  3 Jun 2025 20:28:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 343ADD87
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 20:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3204441D8C
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 20:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKyTyHKPJhau for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 20:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A66341D84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A66341D84
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 20:27:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6942C878DB; Tue,  3 Jun 2025 20:27:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Jun 2025 22:26:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe4533fd0d060adb7772fb365468afdcfadc8a22
X-Git-Newrev: 3c874e1a94925b46a73a394825c65ca2e04c2ace
X-Patchwork-Hint: ignore
Message-Id: <20250603202756.6942C878DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: security bump to v8.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c874e1a94925b46a73a394825c65ca2e04c2ace
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Among other things, this fixes the following CVE:

- CVE-2025-27151: redis-check-aof may lead to stack overflow and potential RCE
                  see https://www.cve.org/CVERecord?id=CVE-2025-27151

The license hash changed, because Redis 8.0.0 mistakenly included the text
of the GPLv3 instead of the AGPLv3, which has been fixed in 8.0.1

See the full changelog here:
https://github.com/redis/redis/blob/8.0.2/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 4 ++--
 package/redis/redis.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 13845bd7a2..4dfe1543d4 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  cf395665ba5fcecc4ef7aed1d8ab19c268619d98595827565c82344160171262  redis-8.0.0.tar.gz
+sha256  e9296b67b54c91befbcca046d67071c780a1f7c9f9e1ae5ed94773c3bb9b542f  redis-8.0.2.tar.gz
 
 # Locally calculated
-sha256  a797fcaa899397001f7fb0097583db96bcc74e9b0606c95435d8a293d84cdb76  LICENSE.txt
+sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 7ef4401123..a4b6b4d652 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.0.0
+REDIS_VERSION = 8.0.2
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
