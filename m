Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDD8C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 20:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA68812DC;
	Mon, 21 Apr 2025 20:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ll2ykTv8Zhe3; Mon, 21 Apr 2025 20:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F976812E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F976812E9;
	Mon, 21 Apr 2025 20:24:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EE831BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60CD140874
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuAWTZNxyJt6 for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 20:24:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.221;
 helo=smtpcmd01-s.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 617E640872
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 617E640872
Received: from smtpcmd01-s.aruba.it (smtpcmd01-s.aruba.it [62.149.158.221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 617E640872
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 20:24:21 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 6xgguYrN2RBkH6xgguBRKM; Mon, 21 Apr 2025 22:24:19 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Mon, 21 Apr 2025 22:24:18 +0200
Message-Id: <20250421202418.919598-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNnIXiYDhRUXUDvHynzQSKptCu/Rr3Wt6sfRa6EXe7cBBEM0SrpPUP3DZZhGWVU8d0Zjn5f4/OPkw91pYRSFFigJ59Pgu+lySmMNo7QIsrdH921BCBAx
 BzCjroz3AJALIImW9+99lLn6zSDFGDR7CQzDj/zy3y28TC0B+Ec01ZSIcQbOL7tv/zWtylmw3SUx1rkdgRItArWpmD5bMUg1zAEIa92P4z1uNTqWX6Sf7tDN
 wLHZEG73EvIFOq1hHhZDZ148Yr7jJL7ckixf+u78/p33xBt2rsd9WlTwl7G5P0LBOy+d7ob/5fUDVoESf1munMhx0bWOkUVNZ4qpJAeMSEg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1745267059; bh=dgwwNUWSGtKc4qyzyXWoofhpLK/rnyCzeB4BoDf694g=;
 h=From:To:Subject:Date:MIME-Version;
 b=L5+uId0jIHaIgKXwjkgrySFsQGs8amrVivOH4Ch+GRimBiMJu0pDUAdZIptJOKYCE
 vwXbmP8NuFO0Uc+rLyoxSn0DWZYJFCELbPqD96gUSavOVtYfKOkSha14eesm4DIcB/
 xH1qzPFhtP8sfSX2Wl5DkK8c3tptLTI/AWbLdeY8Gz/kJ8pbpJHcwcT8T4ssCQSiLA
 FTKQ23hnyIjVUFq1WU5Sv//m66TkVwPdu1rZAjaYnkV8D4fismrAcx4wwIdFj6VtJU
 8jY/PnaTX4qqWyQ/CWQpZO3zL3w7189vev/EwR5tGL8M39lUWFGYKihK8x4enIRmj7
 LwE0o7WsePx0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=L5+uId0j
Subject: [Buildroot] [PATCH] package/libtracefs: bump to version 1.8.2
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

Release notes:
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=libtracefs-1.8.2

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libtracefs/libtracefs.hash | 2 +-
 package/libtracefs/libtracefs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtracefs/libtracefs.hash b/package/libtracefs/libtracefs.hash
index e728e6431f..17036c3f00 100644
--- a/package/libtracefs/libtracefs.hash
+++ b/package/libtracefs/libtracefs.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  d295aa20d711c313a9e229dbd15ba14026f0c1a50d57ae8b0823cc561b23745f  libtracefs-1.8.1.tar.gz
+sha256  255980e1da5648fbbc32777ed8457b485b2b96f3449674610b46d9c437271209  libtracefs-1.8.2.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtracefs/libtracefs.mk b/package/libtracefs/libtracefs.mk
index 86baa5d9cd..d24763fa7d 100644
--- a/package/libtracefs/libtracefs.mk
+++ b/package/libtracefs/libtracefs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEFS_VERSION = 1.8.1
+LIBTRACEFS_VERSION = 1.8.2
 LIBTRACEFS_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/snapshot
 LIBTRACEFS_INSTALL_STAGING = YES
 LIBTRACEFS_LICENSE = GPL-2.0, LGPL-2.1
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
