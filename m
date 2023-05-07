Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6AAC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 20:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 836FA405C4;
	Sun,  7 May 2023 20:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 836FA405C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zjadnaI_2s8q; Sun,  7 May 2023 20:49:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE140401D2;
	Sun,  7 May 2023 20:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE140401D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 846061BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 20:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56E9D60E13
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 20:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56E9D60E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkqTHn_E45rf for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 20:49:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75B5E605E3
Received: from sender4-of-o55.zoho.com (sender4-of-o55.zoho.com
 [136.143.188.55])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75B5E605E3
 for <buildroot@buildroot.org>; Sun,  7 May 2023 20:49:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1683492543; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OV4ddjMsjxBoflofJyXdT0kMUdSJkOKqZdpaaLZ3lOIPivvMNV6rWtUrUuFFLzm1VBUegh/3YvbrmuRGAIdyAl0Eeqea1Hkpx9DZyq733AjfDu2oDHsMI295Z8EBcdg5CDzDymmLfDVAoby8wNYYL8YsCvnSMDu2epI70YZViFg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1683492543;
 h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=75G6OE2XP1JyJAyN3gOzbP3zEuq+p+9sKd0BEooGOCY=; 
 b=Z8tvJe7yLQCIYCLAJjE8rL7HWuim6eQaUutFyov9kgu8NgLzibVZwe4Hku0oZFxYn8LDuznkSrJGbec9T8t9rnHQcW+GjwGxmgqlmhWkivJmBDAOTN7wlFc0M5jakNcqOoUcHy3qXVuShwN0gLfyu60pG81KaLZ7/rMSJbn9aRg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=leon@rinkel.me;
 dmarc=pass header.from=<leon@rinkel.me>
Received: from ubuntu.fritz.box (port-ip-88-150-40-22.reverse.mdcc-fun.de
 [88.150.40.22]) by mx.zohomail.com
 with SMTPS id 1683492541817403.9742706661473;
 Sun, 7 May 2023 13:49:01 -0700 (PDT)
From: Leon Rinkel <leon@rinkel.me>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 20:48:42 +0000
Message-Id: <20230507204842.1390-1-leon@rinkel.me>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230507195031.163142-1-leon@rinkel.me>
References: <20230507195031.163142-1-leon@rinkel.me>
MIME-Version: 1.0
X-ZohoMailClient: External
Subject: [Buildroot] [PATCH v2] package/bat: bump version to 0.23.0
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
Cc: David Pierret <david.pierret@smile.fr>, Leon Rinkel <leon@rinkel.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash for LICENSE-MIT, to account for an update in the copyright years:
https://github.com/sharkdp/bat/commit/d43d241f5bac0fde7881b55f61644e0408181cf7

Signed-off-by: Leon Rinkel <leon@rinkel.me>

---
Changes v1 -> v2:
  - Justify license hash change in commit message (requested by Yann E. MORIN)

Signed-off-by: Leon Rinkel <leon@rinkel.me>
---
 package/bat/bat.hash | 4 ++--
 package/bat/bat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index f4d3e32c34..a79cb8f9a3 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  7940641baaa61cd3bcd1c3db4804d179609d6ccd955868928a129bf3f853e0b2  bat-0.19.0.tar.gz
+sha256  b29af37f274019cf1a36d9483c6f30ff780d3be9d0a9e6a96a43737388b7e409  bat-0.23.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
-sha256  64de710b6309a7db5e44ad0af382300c7fb6f6d116d8ae32f0164e05db033068  LICENSE-MIT
+sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/bat/bat.mk b/package/bat/bat.mk
index dc29a85429..395134df17 100644
--- a/package/bat/bat.mk
+++ b/package/bat/bat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BAT_VERSION = 0.19.0
+BAT_VERSION = 0.23.0
 BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
 BAT_LICENSE = Apache-2.0 or MIT
 BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
