Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B55C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 20:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B72540856;
	Fri, 10 Jul 2026 20:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZoesF1Cb4Le; Fri, 10 Jul 2026 20:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A811C40A2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783714038;
	bh=caF8s5X+mEHz8qXiVBtPPfJUXZRPf5124qGRMQi5MFQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T/Rea2WVKe0bHBXYXKJ0jlc4p2p9eYAXNQteQJFocc3ZVP20Q/uO9ckDbg2DePP+K
	 Ldwy8I+SUCGcVTUeKVk0T/MYp3A/uxJC77hKNIsPclSD4R1YR8DCfbAN4quG4A/sEl
	 VL18sh3std1zlNklyNFF3SwHWrnlZvRvNms7+dGYO66zh4rWPZaAOJx0yyjD5Gv4pd
	 1upnpvox6E4YZ6/MYrvjL6NDl6yVlgvs/uOJQfRGq/NJaHIpvC8ezJs/JLRzkASO5E
	 8TtyuTQ5UuD8Ypw8+dHY4TgWBWR/GOZuI2ud/s6U1avZWOrGa1ngNJgwguPCicBtoj
	 4RyRKsWxHo9uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A811C40A2A;
	Fri, 10 Jul 2026 20:07:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 346D4372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25D1C40A3A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tTvzUcFlwxOn for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 20:07:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A69E40A2A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A69E40A2A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:07:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FD11886C6; Fri, 10 Jul 2026 20:06:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 22:04:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb38f6f7208497cf5a4df922e833492001170111
X-Git-Newrev: f5b8983aadd3c5f43050962338cf7a0427df77dd
X-Patchwork-Hint: ignore
Message-Id: <20260710200643.6FD11886C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jansson: bump version to 2.15.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f5b8983aadd3c5f43050962338cf7a0427df77dd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/akheron/jansson/blob/v2.15.1/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jansson/jansson.hash | 4 ++--
 package/jansson/jansson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jansson/jansson.hash b/package/jansson/jansson.hash
index 747f9e4420..af376253d4 100644
--- a/package/jansson/jansson.hash
+++ b/package/jansson/jansson.hash
@@ -1,3 +1,3 @@
-# From https://github.com/akheron/jansson/releases/tag/v2.15.0
-sha256  a7eac7765000373165f9373eb748be039c10b2efc00be9af3467ec92357d8954  jansson-2.15.0.tar.bz2
+# From https://github.com/akheron/jansson/releases/tag/v2.15.1
+sha256  f9aa4b3ec8496fee69db94f06f3d76fd4a26b012ee9bf1e917078c2cd2841881  jansson-2.15.1.tar.bz2
 sha256  150d90904cd8de73609bb177b42edd3867b07b4b7b786dbba319f30de39fcda2  LICENSE
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index e60bb1aab6..29d43c9a0c 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.15.0
+JANSSON_VERSION = 2.15.1
 JANSSON_SOURCE = jansson-$(JANSSON_VERSION).tar.bz2
 JANSSON_SITE = \
 	https://github.com/akheron/jansson/releases/download/v$(JANSSON_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
