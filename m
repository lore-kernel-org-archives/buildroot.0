Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DBDF44842
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 11:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C79AA82F11;
	Fri, 10 Apr 2026 11:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5oFXqDUuXrGd; Fri, 10 Apr 2026 11:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC4D382F4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775821678;
	bh=lTQIydtak7gcuJun+r7VHAc3A/GuHf4EFTJbhDz4RUk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PY4jgY5ayp7ItDNs4npmz7cwMUVjAEf1mWj+TwUkZuv6MpaTusaWaGQTYUt618NsZ
	 f2pbdtTeObWL6KPUSIVyAI8sHDMhfGOjCue2b5ppNwKwOFikR7eNZAov5UVNn+PNN9
	 cz2wJp5u518H/gYEtymBKpAzbOwZwxceTlQ9APF5Ja2+pQC6op4K6VZ5sFphFMkPVe
	 WreQI6KXWoA7bhzq1xnV9pnHOnfTLFiPfSHZ8rEjehzZF3Y7nEBb34yypzab/ajNcs
	 vOoAB5b4EwHHQSrbSXA5ksXBkX7jubYqzs9ZOS6mDfXLrrPkqd2ncYYoAnpREVxlaM
	 yNc5sf9jFr1oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC4D382F4A;
	Fri, 10 Apr 2026 11:47:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 659D1359
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 11:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B70340CBD
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 11:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NENNAlsPJLk5 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 11:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89F4440CB3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89F4440CB3
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 11:47:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 182728108C; Fri, 10 Apr 2026 11:47:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 13:45:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29a49271574095fb813ce7896c630a6e5fd78764
X-Git-Newrev: b6938ec66c545e7f8681feee12671422d8b10f6b
X-Patchwork-Hint: ignore
Message-Id: <20260410114754.182728108C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: bump to v8.6.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6938ec66c545e7f8681feee12671422d8b10f6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes:
https://github.com/redis/redis/blob/8.6.2/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index e690dd1eaa..5e67e1a28c 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  0e7c150919e10c630d6e806fa7e65ce12aa90ddd0805e459b7da64ee65892805  redis-8.4.2.tar.gz
+sha256  cea46526594fe05f05b9ff733179eb1263deccf4269059cf081fdef222634c88  redis-8.6.2.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index fb166b6f49..6ce9933029 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.4.2
+REDIS_VERSION = 8.6.2
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
