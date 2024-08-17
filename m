Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A792EC52D7F
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 14:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393494022A;
	Sat, 17 Aug 2024 14:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqEYevQgdu30; Sat, 17 Aug 2024 14:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3D944023F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3D944023F;
	Sat, 17 Aug 2024 14:47:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D08241BF57B
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 14:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE3CA60630
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 14:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6NpKuV7cdpFd for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 14:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 38AAF605C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38AAF605C8
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38AAF605C8
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 14:47:35 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4516A3521188; Sat, 17 Aug 2024 16:47:33 +0200 (CEST)
Date: Sat, 17 Aug 2024 16:47:33 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsC4BZadtEq7CZQw@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723906053; bh=ZZTWldfD1nS7qgEcPwFSjg/huU1UUH7iU6wjv9o+HlQ=;
 h=Date:From:To:Subject:From;
 b=EZDj91u+dXC0HMHL/vmyww0itoHJb53l1PCDphbbU/NDvKDM8N1ytUcg7tuyfPE58
 pEbRDy7ZlR/m9BT3G5LbQMJXaFr1jbKdb/xb1WGPjZPH8StJ5AMnLIabiKUApHhMzC
 AXXggWYrusINGviflFQwatbxVSof5gKHYTYl93DCFDn+2nQHyB5aJCcoqHo5K7kIEw
 yB7ZBSi9fYDNFSWjLTDVSrpK5AEWbogX4V7yOvXmd6lK2JfG0LMoigc9XSkdpjW7by
 CEnsPJWCe8b40dOwos3EYBN0Lsyt+V2EkgF/o2MNjwUKYZ0t7bdoefA9xppwVEwoSo
 F+W0yc9Fxz7Rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=EZDj91u+
Subject: [Buildroot] [PATCH next] package/strongswan: update to 5.9.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For a changelog see here:
https://github.com/strongswan/strongswan/releases/tag/5.9.14

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index ed8cf0ae31..f6b16fc8a2 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.13.tar.bz2.md5
-md5  9ada6be0c89846fb7ded1787a17cfbb2  strongswan-5.9.13.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.14.tar.bz2.md5
+md5  21ca3fc7c18456405d03b77266ba630a  strongswan-5.9.14.tar.bz2
 # Calculated based on the hash above
-sha256  56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55  strongswan-5.9.13.tar.bz2
+sha256  728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678  strongswan-5.9.14.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 41959793a3..a3fd9fe449 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.13
+STRONGSWAN_VERSION = 5.9.14
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
