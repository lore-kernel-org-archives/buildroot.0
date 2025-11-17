Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87DBCE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0A9381EAE;
	Mon, 17 Nov 2025 20:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kN6Hg1FnSSq5; Mon, 17 Nov 2025 20:23:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE2848349A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE2848349A;
	Mon, 17 Nov 2025 20:23:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6055DD5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 461F4413E4
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fedopTVu2ZQK for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64C05413B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64C05413B5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:23:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 618DD849F4; Mon, 17 Nov 2025 20:23:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Nov 2025 21:09:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 699614e7fd158f6c03efb468a214d0723eaff0d8
X-Git-Newrev: 896e19a5c64a12bf39f0f03aea94c77b684111f8
X-Patchwork-Hint: ignore
Message-Id: <20251117202355.618DD849F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: security bump to v8.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=896e19a5c64a12bf39f0f03aea94c77b684111f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release notes: https://github.com/redis/redis/releases/tag/8.2.3

This fixes the following vulnerability:
- CVE-2025-62507:
    Redis is an open source, in-memory database that persists on disk. In
    versions 8.2.0 and above, a user can run the XACKDEL command with
    multiple ID's and trigger a stack buffer overflow, which may
    potentially lead to remote code execution. This issue is fixed in
    version 8.2.3. To workaround this issue without patching the redis-
    server executable is to prevent users from executing XACKDEL
    operation. This can be done using ACL to restrict XACKDEL command.
    https://www.cve.org/CVERecord?id=CVE-2025-62507

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index beda6bc48c..f9c70c469f 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  4e340e8e822a82114b6fb0f7ca581b749fa876e31e36e9fbcb75416bec9d0608  redis-8.2.2.tar.gz
+sha256  d88f2361fdf3a3a8668fe5753e29915566109dca07b4cb036427ea6dc7783671  redis-8.2.3.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index fbad637aff..c8073407b9 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.2.2
+REDIS_VERSION = 8.2.3
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
