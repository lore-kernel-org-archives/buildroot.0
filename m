Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCE0C02190
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 17:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41946605FA;
	Sun,  2 Feb 2025 17:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NP1YvDJY94d; Sun,  2 Feb 2025 17:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 440D66065C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 440D66065C;
	Sun,  2 Feb 2025 17:40:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 029E012A
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 17:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9AF46065C
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 17:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HEiTyHrkofHu for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 17:40:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 53B7E605FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53B7E605FA
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53B7E605FA
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 17:40:49 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4443F353CA00; Sun,  2 Feb 2025 18:40:36 +0100 (CET)
Date: Sun, 2 Feb 2025 18:40:35 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z5+uE18qBlzcrWQC@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1738518036; bh=L4zsCHV/d4ZteajB3XynXRD7LdD5JsqfvjXENyjzWHg=;
 h=Date:From:To:Subject:From;
 b=LNfdniqe3b4QDNM/tnPsah+QYk+Kt4ICa+Jo+uiZprtnYABMmCa/JURSxLnoGGWmQ
 hF3qOmLm+Z/EPzteXifuS/6saLwuA8zPr+CuJZ5IiCgS+34D1++PDnB80USKrpg19x
 UJtiwT1AV5y9bvf/pl6f3pNaT36xyDjRH+q0xe2kdVVEmmmgQR9RbUlgNjSsMJT2XB
 CtcKYTGbgKeg2KF9zzhejs5HAyo38vKjeg3iJZe9/EixDJwQ1d9+KciTVK5uO49teM
 1sd9+b3bORTEo9odZ+CDSuJ9lrH7c4LcJWhvm5GAq3og2TIse48rapMI3n5SFHv5Vx
 n7b79uLk4e2yw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=LNfdniqe
Subject: [Buildroot] [PATCH] package/squid: update to 6.13
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

See here for changes:
https://github.com/squid-cache/squid/releases/tag/SQUID_6_11
https://github.com/squid-cache/squid/releases/tag/SQUID_6_12
https://github.com/squid-cache/squid/releases/tag/SQUID_6_13

Download URL moved to Github.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/squid/squid.hash | 5 +----
 package/squid/squid.mk   | 4 ++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index e0dede862a..df52a3be16 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,3 @@
-# From http://www.squid-cache.org/Versions/v6/squid-6.10.tar.xz.asc
-md5  86deefa7282c4388be95260aa4d4cf6a  squid-6.10.tar.xz
-sha1  70e90865df0e4e9ba7765b622da40bda9bb8fc5d  squid-6.10.tar.xz
 # Locally calculated
-sha256  0b07b187e723f04770dd25beb89aec12030a158696aa8892d87c8b26853408a7  squid-6.10.tar.xz
+sha256  232e0567946ccc0115653c3c18f01e83f2d9cc49c43d9dead8b319af0b35ad52  squid-6.13.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index bfb3664082..021d21430d 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQUID_VERSION = 6.10
+SQUID_VERSION = 6.13
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
-SQUID_SITE = http://www.squid-cache.org/Versions/v6
+SQUID_SITE = https://github.com/squid-cache/squid/releases/download/SQUID_6_13
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 SQUID_CPE_ID_VENDOR = squid-cache
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
