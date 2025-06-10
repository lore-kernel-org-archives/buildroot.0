Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509B1C5B552
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 09:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7DAA6078E;
	Tue, 10 Jun 2025 09:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3Z_WYcwwjCG; Tue, 10 Jun 2025 09:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D66F260782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D66F260782;
	Tue, 10 Jun 2025 09:32:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 721AB237
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 09:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 638E080EF2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 09:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KDzSoti_8t24 for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 09:32:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.134;
 helo=mout.kundenserver.de;
 envelope-from=thomas.claveirole@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C70980E74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C70980E74
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C70980E74
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 09:32:55 +0000 (UTC)
Received: from lesya.tangerine ([185.213.154.178]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1MMoOy-1u69xp3OfE-00VKek; Tue, 10 Jun 2025 11:27:49 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Tue, 10 Jun 2025 11:27:13 +0200
Message-ID: <20250610092713.1739052-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:bdx3zyDjFU//zbSZCHpZoyfRQhX8ndOKmh8eUEbU3wSIarizN0q
 yKAE2z0rn14agJPId/ye+kUc4xUK1MAKkPEzjBUvNba0ZBRMMfPEO21i6eXaYZfwnZk8mu7
 pIBxN8z4Yjny4ot7mKo3rnAl5519CXxq4LDcmwGdl+F5UfSbF8bj+WvvAI5Q+EhcznjFiPl
 4isdczuiefVIWetMll4NA==
UI-OutboundReport: notjunk:1;M01:P0:NmUSrNyBcfw=;JceQveoxW12uQlThgWqs7MZ5poO
 KYM3EFGQyDByk7SiCchYwsgHUAEjzIpuSVXsmoh+MH7Pe8qYkYN7dMgEqMlPV2DIJS8y+l7c6
 W7WpjA0jSQ4LUx7T1M5LI9OjQO/VaJsQXAzUkT0Jy/+G/F3WqYSqKYDqEt9Aa4oVbGIzc7BL/
 mRJMc89bsqmjpiIyK97J45/K00HOu9b+zlcpVozveI8s0/ZRtobMmp1AgLkuezJ4/3lJ6M+Ld
 Tj42eNgQUyUd0SfNnjYvKQ4MBk1F+2jPePetdhRDNrtTGUsU2YQBrFIccLkWvCfoG/GFdme+d
 X52nqQdTZBruIicXhSrEwjS0dMQ1MdkkW4sOPjwENLnknACyPIKOdVS0fP059Lm5/hHZE0odI
 jopf6iyMtCp9vDugSE8bVfjZyUo+mE99egZlktrpz0LoWEcnAYitCCtMdTL7trBsnNIicoyCl
 HA/03dfLA2FRVcJdTh4kY7fdJubfIiajlQ2a2agk+q3SrDP6Hte/qwC2o9hP1fYiJscRkmy3Z
 21nmhfn4CBCRtxVOZsKafGrrB0LtdRX3xYpGWgj+dNGIYj0AzAu7tmuSd/tnxHbUvKrIUW7VC
 JA6FhE5PKrYIMeHcMk11BPv5mklwF6JYS/hGc8Q6bZoaINROsntT7nHaCHdxt7hsbWpWMTJlD
 sYEj4RMrRY/b9qwfz1SMH4qcheNGFqn1JODj7yir0z6rq57I1wVehNIZAFTWhlW4GSsnn+iuM
 ploRBu2pda0eiru5HhQecigepYwEe0qWKt2i8rwGB6UwKChq6LvoGhvTpYMYBhasRCpHBWGqk
 ig6v7TQUe6fEbXM4anC0h43Jp28N3doEE6IWPtjvBeH3ROkitvxVF9jBhUHNlRxeBOKgBRvug
 0wpTSYFImLX3vj55gTtFNrVPW4r0maSHsEoLlVLzrW1WaUlQTazHsu3kT5/ZloF68p/lzgyZx
 CcEe/KShHKRP5DIn6xgGE6oyvNKhfqcKKIBxg+Wrhvwr2xv6n6in5iJ/BQcqPhUyeNd/A0CuR
 0iYOpxPBtmi+TyTyqr5Yf63avZqV4QPuzH0Wwss8x4tuEMSf6NH4BgBufDauJGoTF8kPhQLyS
 +d1CxTPhtMHc/Tx5GA3jTAEE8MqQTbPDdeTP9y5sIvz7TZhEdMlTHqY8YunkIJiyAL0RPADhJ
 ljedePxN+LleU+VyKNfoVa/2fozyCc9Jru/VSYA309tV0ykoJ7AVwVcPRH86uc5qyOxzlxAOe
 S47A7XsDbSp00ahLd58BPDw+qizySgBOBzcJWkrJBiDLVE4u1mBI5+PLZg2HQkXcJ+hvvFKuA
 recvoavKrsEPfhhOLOrKqWkpX3Kf426wdGs5RZloGrRLenWr/UO1uX8GVSNgyXYHVzT/Y14HI
 +nBDrHINZYlleKmj8SmyGOIGSFMKoVAERI/DquuZ4a4Uk83i/dPCDoYsIMJ+ombn6qBiZMt/+
 TalGgRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 10.5.0
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
index 44c1160019..50f4dbe849 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  30510a365596372cc622f68452610a2150577e8b4416934e396683ad5de013c8  v10.2.1-package.zip
+sha256  ff847580458b10c85dcb38699733368d67037f855fcb6a5fce46e6412737cf67  v10.5.0-package.zip
 sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 1abed9c6b5..e62ea35fd4 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 10.2.1
+OPENLAYERS_VERSION = 10.5.0
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
