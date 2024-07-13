Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10620C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E08E6061A;
	Sat, 13 Jul 2024 09:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxNp6ypqTKHE; Sat, 13 Jul 2024 09:28:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74D3460647
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74D3460647;
	Sat, 13 Jul 2024 09:28:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3C8E1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDAB740204
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdDK4TZS9LRY for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:28:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1E9B40190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E9B40190
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1E9B40190
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:28:46 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0AFA13536265; Sat, 13 Jul 2024 11:28:42 +0200 (CEST)
Date: Sat, 13 Jul 2024 11:28:42 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZpJIyk4HUUwuvaTE@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1720862923; bh=653gJbuM2teZm3/ngsKHUkkPgbyp3HnUa6RoI0oV6ls=;
 h=Date:From:To:Subject:From;
 b=HTXc98laF99TsRbZZ2g3d3sZRujAq/VEF98XMV+ZJa2vcUIEFyeDuJeNCyJHhUOpJ
 zZx9f8nv5ZLN4K8wAmRcmVlcN51hSdPvx8yoSXP/MjmZeo8nDtLbdra3CGngaQtxdm
 iLxCELguCGyo3HMFGNSCjfNHqcdeJwdx1uQTNKR9E5W+bHKHJlyTn+9aLUfgxiBKpY
 5CJtI/3jRn3EMz8eSw8GGdkWEYD6CAFUnf/LdIVwwR9D/X4oYfvwjzU3boge9OPw9O
 HaZqaFw5IPFJqQ9XTMDqzvNPqqdQPF+zuGiS72arPnAfNO84ApXK2tY0qeUzxr0+qp
 9dS7xRRMZ8liQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=HTXc98la
Subject: [Buildroot] [PATCH] package/squid: update to 6.10
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

The ESI feature is now disabled by default. Use --enable-esi if needed.

See here for other changes:
https://github.com/squid-cache/squid/commits/v6

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index e5017ae5cd..e0dede862a 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v6/squid-6.9.tar.xz.asc
-md5  4888e9dc75c0daa0ed526b34c055cb67  squid-6.9.tar.xz
-sha1  5e73b30116ce7111589cc2b1c9bfe3c17efa2e75  squid-6.9.tar.xz
+# From http://www.squid-cache.org/Versions/v6/squid-6.10.tar.xz.asc
+md5  86deefa7282c4388be95260aa4d4cf6a  squid-6.10.tar.xz
+sha1  70e90865df0e4e9ba7765b622da40bda9bb8fc5d  squid-6.10.tar.xz
 # Locally calculated
-sha256  1ad72d46e1cb556e9561214f0fb181adb87c7c47927ef69bc8acd68a03f61882  squid-6.9.tar.xz
+sha256  0b07b187e723f04770dd25beb89aec12030a158696aa8892d87c8b26853408a7  squid-6.10.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 60eca397ec..bfb3664082 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 6.9
+SQUID_VERSION = 6.10
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v6
 SQUID_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
