Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7D1C369AB
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 14:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 319A1828AF;
	Fri, 18 Apr 2025 14:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id icxg4VNtRGRf; Fri, 18 Apr 2025 14:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B399833B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B399833B7;
	Fri, 18 Apr 2025 14:43:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F389511F
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4A5440BCA
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ru1som4bXagU for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 14:43:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9AC0B42D03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AC0B42D03
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AC0B42D03
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 14:43:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.208.157.35]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M9Wuq-1uBIib2c6O-007LYe for <buildroot@buildroot.org>; Fri, 18 Apr 2025
 16:43:21 +0200
To: buildroot@buildroot.org
Date: Fri, 18 Apr 2025 16:42:55 +0200
Message-ID: <20250418144256.24452-2-dalang@gmx.at>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:5MgQiLhqBFiLs2TFz+ZDNxAV0Pfx1y63KZH/vk+xNYHjUMu7Q0E
 EMpXO5BAY27VceTLPS+oWi5DBk8c8e2urF4Njo6D9dx3zu5hGQlqmk4FaBUCJfy747Ho0ee
 8+URdeOQwAQlA0d8oRI9GjJekRkzivKpWX8d+8WFor0vP8rbmoyQOUVX5JyHOCw78PEoDn3
 h8Pg0XvyUYgZwHUwd3Iug==
UI-OutboundReport: notjunk:1;M01:P0:YdSssxODyc8=;nMNmHH6xnMaJ2i23lLRK8BY0q8u
 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
 hSFA+8xdPmIJk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1744987401; x=1745592201; i=dalang@gmx.at;
 bh=arkyisHJOBYf+jhsSmYZv0WoalMFNYrgaE+PG6v6ijQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=G0CIg6p4lB1yWnbyI2aU7B0PngiUmYl7e+ZopPywP8dXNPGiL0G1c+Sgm1Cbowvu
 ADOjbM/vUSaawLuVEeWG0d0YHN/7Uh4LEO3wiFcldnvhr1gu+Q32APEBNEEbqiDsa
 hPgTmiXCb8aBrphRLwDRc6XtjV9sOg8u+DZbZAlo/nxXDRcZ3QvmLnD3Gf42r1ec7
 QDf8HocH8FLP5JLdU+fUkJN+lV4lN9Tlkoz9uGU/4s8VAARCcwskcQQgr1Dv3o0CS
 m+5Ee8W0oXiBeozSZPHQ4Mka/LxIkqzKmCZed5Vf5zAcpsBDN6EanrxgJ0/mj/GJ1
 jRDXWXQekSA0CztWIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=G0CIg6p4
Subject: [Buildroot] [PATCH] package/cairomm1_14: bump to version 1.14.5
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.freedesktop.org/cairo/cairomm/-/blob/1.14.5/NEWS

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/cairomm1_14/cairomm1_14.hash | 6 +++---
 package/cairomm1_14/cairomm1_14.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cairomm1_14/cairomm1_14.hash b/package/cairomm1_14/cairomm1_14.hash
index 6d58de360a..69511993ce 100644
--- a/package/cairomm1_14/cairomm1_14.hash
+++ b/package/cairomm1_14/cairomm1_14.hash
@@ -1,6 +1,6 @@
-# From https://www.cairographics.org/releases/cairomm-1.14.4.tar.xz.sha1
-sha1  a58419bb9792a2c998631704ce5671c38e0c82a1  cairomm-1.14.4.tar.xz
+# From https://www.cairographics.org/releases/cairomm-1.14.5.tar.xz.sha1
+sha1  c33938b021046619d86cd2631f4c79dfd0f5bdac  cairomm-1.14.5.tar.xz
 
 # Locally computed
-sha256  4749d25a2b2ef67cc0c014caaf5c87fa46792fc4b3ede186fb0fc932d2055158  cairomm-1.14.4.tar.xz
+sha256  70136203540c884e89ce1c9edfb6369b9953937f6cd596d97c78c9758a5d48db  cairomm-1.14.5.tar.xz
 sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
diff --git a/package/cairomm1_14/cairomm1_14.mk b/package/cairomm1_14/cairomm1_14.mk
index 6502d34c5a..b19ba08cfd 100644
--- a/package/cairomm1_14/cairomm1_14.mk
+++ b/package/cairomm1_14/cairomm1_14.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAIROMM1_14_VERSION = 1.14.4
+CAIROMM1_14_VERSION = 1.14.5
 CAIROMM1_14_LICENSE = LGPL-2.0+
 CAIROMM1_14_LICENSE_FILES = COPYING
 CAIROMM1_14_SOURCE = cairomm-$(CAIROMM1_14_VERSION).tar.xz
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
