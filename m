Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925D8C8303C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 17:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6717982A83;
	Mon,  7 Jul 2025 17:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zrw1RepyHDaA; Mon,  7 Jul 2025 17:49:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A80583E6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A80583E6C;
	Mon,  7 Jul 2025 17:49:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF2C615F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0E2D40254
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:49:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yO8Tx50F6PhJ for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 17:49:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16ADB40917
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16ADB40917
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 17:49:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02F7086158; Mon,  7 Jul 2025 17:49:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Jul 2025 19:48:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7981df0c82b3f2456749cb4badfa7a0a05d5f0a9
X-Git-Newrev: c87ddd6ee471d8b3a26a684712a4529ec5755e04
X-Patchwork-Hint: ignore
Message-Id: <20250707174938.02F7086158@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: security bump to v8.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=c87ddd6ee471d8b3a26a684712a4529ec5755e04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://github.com/redis/redis/releases/tag/8.0.3

This fixes the following vulnerabilities:

- CVE-2025-32023:
    An authenticated user may use a specially crafted string to trigger a
    stack/heap out of bounds write on hyperloglog operations, potentially
    leading to remote code execution.
    https://github.com/redis/redis/security/advisories/GHSA-rp2m-q4j6-gr43

- CVE-2025-48367:
    An unauthenticated connection can cause repeated IP protocol errors,
    leading to client starvation and, ultimately, a denial of service.
    https://github.com/redis/redis/security/advisories/GHSA-4q32-c38c-pwgq

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 4dfe1543d4..c66223f2da 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  e9296b67b54c91befbcca046d67071c780a1f7c9f9e1ae5ed94773c3bb9b542f  redis-8.0.2.tar.gz
+sha256  33f37290b00b14e9a884dd4dcba335febd63ea16c51609d34fa41e031ad587df  redis-8.0.3.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index a4b6b4d652..5ffb2a929f 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.0.2
+REDIS_VERSION = 8.0.3
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
