Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CB6CAC589
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 14:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2754E8050F;
	Mon,  8 Sep 2025 14:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V9ql6Jzt5N2V; Mon,  8 Sep 2025 14:16:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F28D8053A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F28D8053A;
	Mon,  8 Sep 2025 14:16:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07026186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E20A440054
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J41kICxho85w for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 14:16:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94CA14004F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94CA14004F
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 14:16:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B36483CAF; Mon,  8 Sep 2025 14:16:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 17:23:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b542d662db110e4ce657ce3f35ce6a065e7ed879
X-Git-Newrev: 874601825f848f9c4f6e8d8086c154f0812666d4
X-Patchwork-Hint: ignore
Message-Id: <20250908141619.8B36483CAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis: bump to v8.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=874601825f848f9c4f6e8d8086c154f0812666d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes:
(https://github.com/redis/redis/blob/8.2.0/00-RELEASENOTES)

===========================================================
8.2 GA (v8.2.0)    Released Mon 4 Aug 2025 15:00:00 IST
===========================================================

This is the General Availability release of Redis Open Source 8.2.

- Streams - new commands: `XDELEX` and `XACKDEL`; extension to `XADD` and `XTRIM`
- Bitmap - `BITOP`: new operators: `DIFF`, `DIFF1`, `ANDOR`, and `ONE`
- Query Engine - new SVS-VAMANA vector index type which supports vector compression
- More than 15 performance and resource utilization improvements
- New metrics: per-slot usage metrics, key size distributions for basic data types, and more

Note: the full release note mention three CVEs fixed in 8.1.x and 8.2.x
series. Those security fixes were already included in version 8.0.2 and
8.0.3, already in Buildroot. Therefore, this commit is not marked as
security related.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add comment in commit log about CVE in release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
