Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B377CC6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 12:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38E6F605A6;
	Sat, 11 Mar 2023 12:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38E6F605A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uf5ss4ySbrRv; Sat, 11 Mar 2023 12:46:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93D4B60B74;
	Sat, 11 Mar 2023 12:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93D4B60B74
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B66921BF3DD
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 12:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D6BD4049F
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 12:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D6BD4049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z56iistotPw3 for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 12:46:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C94640140
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C94640140
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 12:46:17 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.13.46])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F024013F87C;
 Sat, 11 Mar 2023 13:46:12 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Mar 2023 13:46:06 +0100
Message-Id: <20230311124607.464110-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678538774;
 bh=fygy3ZiN8ldZM0PcKpSGkn26A+z2sKDLuGzlFGk1Ztc=;
 h=From:To:Cc:Subject:Date:From;
 b=Lo681pQJf1wK4yvipJFQLqhuFMFlvfsjV8vdn3dIYyhGPluf6kn80TZjlEpWKo0dl
 XM1Qw70/G3IpBSsz0AAKGaswpCBCUAjezdK1nSgpk+xxOE85cJamNyDPeMtL76XMoN
 Gwf2ZuVmrNJymAyWTdWq+oOrPFjHpjw6hz42lxOLjDM4KBdEiiraEqDctNUzBRF62q
 xAMxlRsLD4R91OGWWOcgIt3M+6L8/Qd1OF70cBVUraaHwbGX3A3UBMHB+Ffm0wdekc
 iJnXYZz0sIbKLTUcgcYYbTJtr6okfnB9UeRk00oJl0C4yDNxtCZH3gykiET5f1yXU8
 h6GakwavXjQew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Lo681pQJ
Subject: [Buildroot] [PATCH next 1/2] package/lsof: bump to version 4.98.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 4.96.5, see:
- https://github.com/lsof-org/lsof/releases/tag/4.97.0
- https://github.com/lsof-org/lsof/releases/tag/4.98.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit b793f3a with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p lsof
    ...
    45 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/lsof/lsof.hash | 2 +-
 package/lsof/lsof.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index 29cf443a24..b6a29b3cea 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e9030af1123ff052ab69e12ef55b8a17dc47ac4bccfba85ee1ca1f31acf29607  lsof-4.96.5.tar.gz
+sha256  80308a614508814ac70eb2ae1ed2c4344dcf6076fa60afc7734d6b1a79e62b16  lsof-4.98.0.tar.gz
 sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index fd5887141b..66911dddb9 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.96.5
+LSOF_VERSION = 4.98.0
 LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
 LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
