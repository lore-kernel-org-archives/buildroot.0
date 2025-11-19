Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002CCCF6488
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 22:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA511611F0;
	Wed, 19 Nov 2025 22:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQ5p_anPUXTf; Wed, 19 Nov 2025 22:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B37460858
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B37460858;
	Wed, 19 Nov 2025 22:50:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C78E42A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE44660858
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7U5k_RWmg5u for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 22:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 78EB660853
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78EB660853
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78EB660853
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:50:48 +0000 (UTC)
Received: from pyk-laptop.. (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6DD7CB00535;
 Wed, 19 Nov 2025 23:50:43 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Wed, 19 Nov 2025 23:50:32 +0100
Message-ID: <20251119225032.4183326-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763592645;
 bh=v5IlQk+94pMxBkDHG8GefE8Ucn8ox2faiteD0e0Rqnw=;
 h=From:To:Cc:Subject:Date:From;
 b=erSfZvofEy5HOVrAGI/hXFsKLv2Qik2tTPWeFfulNDR/HV3Y+dC13bnxA1kA4JRlf
 SKTlqUfS05m1z1DOY8soUnXV40KVzlaCzvEFuQ5uAboU+8JZw7hSi2QMDKsHoLRgn3
 56UZgFA8GfTkuje0vrqGvlazXUYR174HPGeW9kpjkFmrLAO6scaFav+3tsYdf3HGWg
 Fg6jAZP3A23lV2q2NUxbZLebYTKlm8wjXK1KxLsbdglgGoOZFE1rcseHDE7TMOm1DS
 9v5Jbs1ldNU9raBM3vszOmF+ve7Ji4VjB72efaZGiXTjj5MbJAvUSS7SHRgSIdVbBd
 iQAfsmVFFqHcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=erSfZvof
Subject: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v60.0
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v58.0, see:
https://github.com/linux-rdma/rdma-core/releases/tag/v59.0
https://github.com/linux-rdma/rdma-core/releases/tag/v60.0

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/rdma-core/rdma-core.hash | 2 +-
 package/rdma-core/rdma-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
index 8ae78046f1..fd538fc5a4 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  08a554e0f95bb6869f9fbc2b1eb5521a85104dda9bf730db42b1a10d0b009e28  rdma-core-58.0.tar.gz
+sha256  aa9ca1f5a9e356f770441f52254ddc70ff0a4df76a25383e422075eb730efb4b  rdma-core-60.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index 938a6398fa..99b77dc03c 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 58.0
+RDMA_CORE_VERSION = 60.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
