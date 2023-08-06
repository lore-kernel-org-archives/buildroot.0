Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDB7C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 10:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F5A340221;
	Sun,  6 Aug 2023 10:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F5A340221
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7qMEGecBLp8b; Sun,  6 Aug 2023 10:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C55410D2;
	Sun,  6 Aug 2023 10:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C55410D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 162D41BF947
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 10:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FE3760A99
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 10:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FE3760A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hzbjSFOlnrf9 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 10:57:24 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DBBD5607C0
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 10:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBBD5607C0
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 06DA213F8C1;
 Sun,  6 Aug 2023 12:57:19 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 12:57:03 +0200
Message-ID: <20230806105703.24653-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691319441;
 bh=cYZ1kMP7iPhhntOdfPFEh11bAVHssfaz0rab7hoJ1N4=;
 h=From:To:Cc:Subject:Date:From;
 b=Z4GMn8QfVta9KOi8n+LV9KWmIMacFZQ+FRxIPPOf69+138LNzv3f7052PbRsuW3QX
 keUSaclLh0IgpNUpx4+Hf2Gc0Qvmv5jqSJSb+7ikdufkMrPa8P+F5I+E6Vb+PMXE7w
 259UiZzbVjLMf320JwFT1D1mKYig3lD3IfsMBPoSfWSUH6P/B4Bhq+le/DSDwqDLVZ
 KDHyYdR0OfiWQEbHo63GronVXE4fzMMu60xRG9hAwZpqmDSgdu3y5P2+UW76FbM6hL
 UW5KsUMDo08JRlb1ue6zsBPuwbLSuQGgaPz1LA3AbZNyn7bRGMyjHItuH6rGA62Sk8
 WD+y6iB8pE/Sg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z4GMn8Qf
Subject: [Buildroot] [PATCH 1/1] package/lsof: add LSOF_CPE_ID_VENDOR
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

cpe:2.3:a:lsof_project:lsof is a valid CPE identifier for this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alsof_project%3Alsof

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lsof/lsof.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 66911dddb9..8d9c1b60e3 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -10,6 +10,7 @@ LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
 # It is also defined in 00README, but that contains a lot of other cruft.
 LSOF_LICENSE_FILES = dialects/linux/dproto.h
+LSOF_CPE_ID_VENDOR = lsof_project
 
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LSOF_DEPENDENCIES += libtirpc
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
