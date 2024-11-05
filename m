Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCD7D31765
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 16:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 306266002E;
	Tue,  5 Nov 2024 16:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 534eNx9g3yfY; Tue,  5 Nov 2024 16:49:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43146606B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43146606B4;
	Tue,  5 Nov 2024 16:49:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7A243B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97F95403F6
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sTb_hq5n84Js for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 16:49:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.73;
 helo=mout.kundenserver.de;
 envelope-from=thomas.claveirole@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECB3D403F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECB3D403F5
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECB3D403F5
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 16:49:26 +0000 (UTC)
Received: from houde.tangerine ([185.213.154.168]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1Msqpq-1tx1SO243E-00xUa1; Tue, 05 Nov 2024 17:49:24 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Tue,  5 Nov 2024 17:49:00 +0100
Message-ID: <20241105164900.205431-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:16+LUyDXsickvNfZ+XuCQ02ZXo/UnsUUWGG49tKiFLRahFeDAkm
 PGQkyE+LjG7Wcsu+6htMX+hNmNbc9x5hdyZotPqDBRHmvaFL65GwyKkA7AswQgmsRs66ASy
 DN7376e82+E+A+vQcmfK8lIFF1PiRA3+ZMbXgZsUt3/6FFCSZTxScvDHthv+MVwQJM0VUY3
 aNHtQxrwOZTRgfsiaMi0w==
UI-OutboundReport: notjunk:1;M01:P0:i7AziT/IvUE=;8/kyilS93Ps9V59Xgv+66eGu4LX
 vu/4XJKcHxRcvPuXe8nnFhezAgGTVvDLM62+PoFR4To65eOK32ypFQ6GJfpDa9SnX2RZ8fb1U
 SEzfTZE37IuhspDyNyEa/7Y3nJwHbhM9kE6j5db79hciRZr4F8c+8Yqynfkhw9MUtkrFFLPQ7
 Wu8LRm5Wtev5ZFks3jiNANi45ORtDDz3IXOBDnwZxPLSchlN/9R/n5ybyB9umOymE+tUGO80H
 1s0T5FPzpCnecGkuzDFtSPiwLHnYmxJKEr9meax/lQHzSNSVQYNMeltvwaShBLmeNzETP4Xhc
 pIpgOq33FMm0jdT32JX92F3kg2KY4SuadL7Ve+FXqUL8oC7sZFGFpwgQaj9bS1VB9cE79kvdZ
 LeDCGAY5jO7Gu/j6BDMmVjBqUL4NQx3mwSGrlfsCqSrh+6d2ZmOV/74e45fcRh08ujhoNdkic
 0Ah9jJqsf3CAF4NFmx6WZURCH/odeO8iZl/ajiD/Tn2+W7pUrYUBwtgE+7VSp77AntgHnfonR
 TGlJ6apd4yJJzQFGWDMWPcQ+7bT2i9VpJpwDUUeFE8UZX0t7v8JKzpTUyfoku2ah+D6uxf8Au
 fvpkO7PN62Js68Yt19lPbIPWzmH8Z/GyYK/N7e9jvHyUAdEHqIb/sj/s5hDxPlNKiYvaRxkJd
 7VPDkgkQv685QlkjF7C3JhFaca+KrOTl9/z/bhOWkBzVPywD1gUaBELxf5Va4k4fwnQNCGBSt
 JGWZH85Hezt+4N6IDAxYnKV7TzresMzEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 10.2.1
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

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index 29261c57ed..44c1160019 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f9818591685d2eda779b346425061ddde174931e89ba2412118f68b3779e0c19  v9.2.4-package.zip
+sha256  30510a365596372cc622f68452610a2150577e8b4416934e396683ad5de013c8  v10.2.1-package.zip
 sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 682138c454..1abed9c6b5 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 9.2.4
+OPENLAYERS_VERSION = 10.2.1
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
