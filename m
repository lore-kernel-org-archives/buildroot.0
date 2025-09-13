Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1494ECAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 09:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8721284386;
	Sat, 13 Sep 2025 09:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VceB9C26OMoH; Sat, 13 Sep 2025 09:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C09B8437F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C09B8437F;
	Sat, 13 Sep 2025 09:57:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B648392E
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 09:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A748C8437F
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 09:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yX6KCTNNndRq for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 09:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 090658437B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 090658437B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 090658437B
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 09:57:44 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E3BC66012F;
 Sat, 13 Sep 2025 11:57:38 +0200 (CEST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Julien Olivain <ju.o@free.fr>
Date: Sat, 13 Sep 2025 11:56:42 +0200
Message-ID: <20250913095642.20835-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757757461;
 bh=s8aHuVxaykoKhzJmSBUPFjklnX0Aj4pbjkZx4Sq+cHU=;
 h=From:To:Cc:Subject:Date:From;
 b=YW4Fc/i/JpdndAo0Gch+o1T0PBGHmX0eDK0RusjH2oL+/bCq8/m/BcCAPZ82JlGgn
 xAjkacwp4En3RmluqgdQPOfeHzPAxJHM8+hepqw0KcLXaXw2fNZJbiS0GsSLfeg6Ge
 R4eMmcMFoj1JGWBy8YC14r2pggTrJJxDRtqgEH4frCtndEf8iXxQcx3FL1F2NpPdRm
 BVKPMgQhiqZjgvS8gBj4T9PIXuCLH6mQPuRcJhkIx0uybxsl8zruRyhKKsQok2s205
 wmxD6wgY7dzTMuR4bRnJznjfAeqkTr31eHLsGUh67Fi7ySoOEM5OZAfMnEFevPybDz
 c4Xv0sXgISoDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YW4Fc/i/
Subject: [Buildroot] [PATCH 1/1] package/apitrace: remove stale patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Running the command:

    make apitrace-patch

fails with error:

    Applying 0003-Explicit-header-stdint.patch using patch:
    patching file frametrim/ft_dependecyobject.hpp
    Reversed (or previously applied) patch detected!  Skipping patch.
    1 out of 1 hunk ignored -- saving rejects to file frametrim/ft_dependecyobject.hpp.rej
    patching file retrace/metric_writer.cpp
    Reversed (or previously applied) patch detected!  Skipping patch.
    1 out of 1 hunk ignored -- saving rejects to file retrace/metric_writer.cpp.rej

Commit [1] "package/apitrace: fix build with GCC 15.x" introduced a
package patch in the branch master while Buildroot was in RC cycle.
This same commit was cherry-picked in [2] in the branch "next" to also
apply cleanly the patch for commit [3] "package/apitrace: bump to
version 13".

The merge commit [4] kept the apitrace package patch
"0003-Explicit-header-stdint.patch".

This commit fixes the issue by removing this stale patch.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/a4b0913280b95b62cd74fdc5ff0b25e3afa2c529
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/bf55f4713e1ba877183b9e31469df5d3823ec4c0
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/aec2f2ddc44d037ad21c9a061475459dd9f3d3a1
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/0af159ae2b0363a90b8c5432cd4cb9bfd3476c5a

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0003-Explicit-header-stdint.patch         | 42 -------------------
 1 file changed, 42 deletions(-)
 delete mode 100644 package/apitrace/0003-Explicit-header-stdint.patch

diff --git a/package/apitrace/0003-Explicit-header-stdint.patch b/package/apitrace/0003-Explicit-header-stdint.patch
deleted file mode 100644
index efd7522314..0000000000
--- a/package/apitrace/0003-Explicit-header-stdint.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3cc8956995d6d702a2c3ef0d7f91500c6accbfad Mon Sep 17 00:00:00 2001
-From: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
-Date: Fri, 21 Mar 2025 05:02:23 +0000
-Subject: [PATCH] Explicit header: stdint
-
-Fix building with GCC-15. It no longer includes it by default.
-
-Signed-off-by: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
-Upstream: 952bad1469ea747012bdc48c48993bd5f13eec04
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- frametrim/ft_dependecyobject.hpp | 1 +
- retrace/metric_writer.cpp        | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/frametrim/ft_dependecyobject.hpp b/frametrim/ft_dependecyobject.hpp
-index cf1885f1..53b910d0 100644
---- a/frametrim/ft_dependecyobject.hpp
-+++ b/frametrim/ft_dependecyobject.hpp
-@@ -28,6 +28,7 @@
- #pragma once
- 
- #include "ft_tracecall.hpp"
-+#include <stdint.h>
- 
- namespace frametrim {
- 
-diff --git a/retrace/metric_writer.cpp b/retrace/metric_writer.cpp
-index e923ed1d..4e4ce748 100644
---- a/retrace/metric_writer.cpp
-+++ b/retrace/metric_writer.cpp
-@@ -24,6 +24,7 @@
-  **************************************************************************/
- 
- #include <iostream>
-+#include <stdint.h>
- 
- #include "metric_writer.hpp"
- 
--- 
-2.50.1
-
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
