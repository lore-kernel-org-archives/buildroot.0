Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA91C83F38
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F2FF60837;
	Thu, 17 Jul 2025 20:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4U4H55G6aSA; Thu, 17 Jul 2025 20:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9640C60869
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9640C60869;
	Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 807A21A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 343E0607BA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F3ugv5kIaDgf for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74CA6607DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74CA6607DC
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 706E080298; Thu, 17 Jul 2025 20:22:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 14:07:36 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f28089db0b6ce279176e6ca74aa60112a41d1cd5
X-Git-Newrev: bdd3382ea55a5871600c5315d709a1d90bcc3b24
X-Patchwork-Hint: ignore
Message-Id: <20250717202232.706E080298@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/redis: security
 bump to v7.2.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=bdd3382ea55a5871600c5315d709a1d90bcc3b24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
(cherry picked from commit c87ddd6ee471d8b3a26a684712a4529ec5755e04)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 158931bb89..630f6b6d76 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  2343cc49db3beb9d2925a44e13032805a608821a58f25bd874c84881115a20b7  redis-7.2.9.tar.gz
+sha256  e576ad54bc53770649c556933ecd555b975e3dac422e46356102436a437b43c7  redis-7.2.10.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 7c847690a9..a2d4fbe138 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.9
+REDIS_VERSION = 7.2.10
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
