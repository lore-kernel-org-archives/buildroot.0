Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722A6D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27E1B812DE;
	Fri, 12 Dec 2025 07:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E1sSr0N3OgRE; Fri, 12 Dec 2025 07:57:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F3FB83CAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526216;
	bh=SrNcmvwtF0vrPCFergPwun2lytNt1m34TVLKtKyZ6TI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T1YhhJXKDhyWPun0n8OXyPiDB3caGmlcv+D8FFk+j904ZxcF0BGDqW3KTfD81IxxX
	 33/QUwpwyVRP5S8lJb4rQVrzdxGXRMO/28VfR9AB/naWqqFJastYjtoDMNUAszAhLM
	 kiYi2bNJad2GruVj8uKyNTdSGhoasPkrdhvcEnlxpBUyHoJ0k/aDnRE8lLSTsqQ+DZ
	 R4tRbRLy7y3YCJIXjf3s7PUhERwqT9AG36zw/RE1ikcJQWZMyBwYbmvG8x/3LQ7xpg
	 alvjCgZT3vGwuCGxYFU28k7DRa4pRhGxAyuQvq+sT2OGQhvju6IYX5kSMGUyZf95eW
	 gWwWY2WFLC8OQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F3FB83CAB;
	Fri, 12 Dec 2025 07:56:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95CD32C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1EAE41155
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crD29JhOu4Mf for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1E34410F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1E34410F7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0C5C86C93; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Nov 2025 18:31:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d397ffed96853fab2985dde4a8126a23af7e22c
X-Git-Newrev: c72c50254b37cb3e7a169133f9449a1fdab26141
X-Patchwork-Hint: ignore
Message-Id: <20251212075535.F0C5C86C93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/timescaledb: bump version to 2.23.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c72c50254b37cb3e7a169133f9449a1fdab26141
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/timescale/timescaledb/blob/2.23.1/CHANGELOG.md

This bump adds support for PostgreSQL 18.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 75396c9164..a2ccc28e29 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  09496504e78a9896eaf7689929f4fa0ab40dde90d202259aa4dcf6ec32fe528f  timescaledb-2.21.4.tar.gz
+sha256  26575fa9e287a6107a6bf162bacab4932b0df19bee38d28c132f9a2d6591d647  timescaledb-2.23.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 234420c105..80c2b385aa 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.21.4
+TIMESCALEDB_VERSION = 2.23.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
