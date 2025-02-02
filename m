Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBAEC02194
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 22:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B57E81F8B;
	Sun,  2 Feb 2025 22:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gscoEGua-ktt; Sun,  2 Feb 2025 22:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8490781F8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8490781F8A;
	Sun,  2 Feb 2025 22:30:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5651E1A0
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 22:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38BBC81F55
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 22:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNZZY4wyUG3Z for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 22:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AFBA81F88
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AFBA81F88
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 22:30:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A48B86818; Sun,  2 Feb 2025 22:30:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 2 Feb 2025 23:26:02 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 011530af107e2c2bcc50a6637352c0f3dbc6d10b
X-Git-Newrev: 7481c699144a2080279922af4c4ccade7c21bbc8
X-Patchwork-Hint: ignore
Message-Id: <20250202223006.3A48B86818@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/redis: security
 bump to version 7.2.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=7481c699144a2080279922af4c4ccade7c21bbc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes the following security issues:

7.2.6:

- (CVE-2024-31449) Lua library commands may lead to stack overflow and
  potential RCE

- (CVE-2024-31227) Potential Denial-of-service due to malformed ACL
  selectors

- (CVE-2024-31228) Potential Denial-of-service due to unbounded pattern
  matching

7.2.7:

- (CVE-2024-46981) Lua script commands may lead to remote code execution

- (CVE-2024-51741) Denial-of-service due to malformed ACL selectors

https://github.com/redis/redis/releases/tag/7.2.6
https://github.com/redis/redis/releases/tag/7.2.7

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f3e99436eec2b5a096ac94c18b9a835806ee9de3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 5c3a5ea4d8..e01fc6a601 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  5981179706f8391f03be91d951acafaeda91af7fac56beffb2701963103e423d  redis-7.2.5.tar.gz
+sha256  72c081e3b8cfae7144273d26d76736f08319000af46c01515cad5d29765cead5  redis-7.2.7.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 852bf31ca0..7eb30abc4c 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.5
+REDIS_VERSION = 7.2.7
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
