Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CC2E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 20:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B616B4027F;
	Mon, 30 Dec 2024 20:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HwzcDP_sI6tw; Mon, 30 Dec 2024 20:00:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC3D04035A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC3D04035A;
	Mon, 30 Dec 2024 20:00:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D842BCA
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 20:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D29F740C13
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 20:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAwzL8kmcoKX for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 20:00:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5A81640261
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A81640261
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5A81640261
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 20:00:12 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EDFDDB00593;
 Mon, 30 Dec 2024 21:00:09 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 30 Dec 2024 21:00:00 +0100
Message-ID: <20241230200000.199571-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735588811;
 bh=naGfryBENt4ZGpbC8c57CmpME0PR8Gwr+GlO7T2nqj0=;
 h=From:To:Cc:Subject:Date:From;
 b=QuXu9JZY0yrx1nl3uDrevkpYMj5T93wmJDPWUvcv+5J/fyGb9tU/EACw2gb35CY46
 iNoAk3s2Tf7xKcr9bvVl9f+gjNdp9fWAgyjtYx1OWBV9yM71CiYiZUP/rYZOafk4Oa
 rSwLa9oXJR/0qGikrHJZKp2kLgN5GiF2ga40J/0yQH7MtXYYhK0kG+Jy9jkEdhb8CM
 swx78hwH/hQXimF6hjw99huVc4kifbzh1iNXz9P6CO4iadz2nLA3F+d+4yt5Mfo+/n
 Sh8r/y/yK3kEgJImvg6gvFPjtKB0fEzQ7GYtJ+LDb2U3TfIbPUIpBheGZaWvrYSVPd
 lcz8l4chh8XgA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QuXu9JZY
Subject: [Buildroot] [PATCH 1/1] package/xxhash: bump version to 0.8.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For the relase note, see:
https://github.com/Cyan4973/xxHash/releases/tag/v0.8.3

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xxhash/xxhash.hash | 2 +-
 package/xxhash/xxhash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xxhash/xxhash.hash b/package/xxhash/xxhash.hash
index 216d07ddbd..fb8e384122 100644
--- a/package/xxhash/xxhash.hash
+++ b/package/xxhash/xxhash.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  baee0c6afd4f03165de7a4e67988d16f0f2b257b51d0e3cb91909302a26a79c4  xxhash-0.8.2.tar.gz
+sha256  aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80  xxhash-0.8.3.tar.gz
 sha256  6ffedbc0f7878612d2b23589f1ff2ab15633e1df7963a5d9fc750ec5500c7e7a  LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  cli/COPYING
diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index f16a784966..51bf6ce855 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XXHASH_VERSION = 0.8.2
+XXHASH_VERSION = 0.8.3
 XXHASH_SITE = $(call github,Cyan4973,xxHash,v$(XXHASH_VERSION))
 XXHASH_LICENSE = BSD-2-Clause (library), GPL-2.0+ (xxhsum)
 XXHASH_LICENSE_FILES = LICENSE cli/COPYING
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
