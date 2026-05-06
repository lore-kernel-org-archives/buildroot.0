Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D569DCD3436
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 12:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9854540A43;
	Wed,  6 May 2026 12:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhNmc6K85IJ6; Wed,  6 May 2026 12:29:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0BDC40A73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778070570;
	bh=61SHRNe/pY0bYl5jURF4RlhAeFm/Q65gTR7F0noJubs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=suAnf839AFEFQ0aarp9nosHux08UxQvF2c8adVa9GUK8X6HKdKcAQMVxG0PQl/uLE
	 yScDAOU6qkBtxZo4/dRO74zkV+X5O65WSgG1ti6HC+XoQol8rLK3tVwPdsLt+V4d1P
	 hm1Sv40GlZXOO2K6aUpb//OCr2Gd2ThqJxjlBVnyDK44bkuQNLBy/9oWK5hspwWRID
	 vDJHyjOAAp8Q3Xw7KzX/LcRui+y4ohZcZNinhEkWKGnHw6MIdX4DLy49PGbXI/+MBF
	 a2BXyPMuYH7fj1AMuJjeombQAHoIfC3etouJSdacQkkdLq43AObE+1AZC8x/yx7IZy
	 Mpg3uce2IBRCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0BDC40A73;
	Wed,  6 May 2026 12:29:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F57C11B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 645CA821A3
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgWrvyUxl4Y8 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 12:29:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C52C1821A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C52C1821A1
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:29:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CEAD847AF; Wed,  6 May 2026 12:29:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 May 2026 14:20:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5af981a6727bb4a5e984c86556ec674e525db218
X-Git-Newrev: 4cdad9ceee3e3826eee788635ee5fb05f77d3bef
X-Patchwork-Hint: ignore
Message-Id: <20260506122927.8CEAD847AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rdma-core: bump to version v62.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4cdad9ceee3e3826eee788635ee5fb05f77d3bef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log since v61.0, see:
https://github.com/linux-rdma/rdma-core/releases/tag/v62.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/rdma-core/rdma-core.hash | 2 +-
 package/rdma-core/rdma-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
index e2da879aa2..e1a7b55587 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c7db745c72fca8168503b73bb0c6f0ff110a865944b7f73f791480c2bff1ab87  rdma-core-61.0.tar.gz
+sha256  7e2db2cb97b18047a40a4054159f64e588801bcece9d5dd9be2c4aca8909f6b5  rdma-core-62.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index 4ace1b8a3d..93021fd882 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 61.0
+RDMA_CORE_VERSION = 62.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
