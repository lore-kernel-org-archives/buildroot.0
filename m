Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85241C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 18:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1233C80C50;
	Tue,  4 Feb 2025 18:27:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Sx57-4ZeYt5; Tue,  4 Feb 2025 18:27:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C62DE8059C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C62DE8059C;
	Tue,  4 Feb 2025 18:26:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C3AF12F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 18:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BF994094D
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 18:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmPRKc5xaLWd for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 18:26:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 212F94094B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 212F94094B
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 212F94094B
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 18:26:54 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id fNdLtN21P1ugbfNdLtD1Jg; Tue, 04 Feb 2025 19:26:51 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  4 Feb 2025 19:26:49 +0100
Message-Id: <20250204182649.71169-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNdn6hZZzZZHae9JitjkveKLBNlMpNfHLARd5Ccc4N44knvsDkN0Ry7j6CnxaS+I3dTlGoBFeBhTmGr4ERuiXmzlIU1fsjhzxCzPnDMlN1aIw+kQp5gZ
 YhI1S2lIZJGZvkrRHHxODsFLN5fYcI+03GKI7PqiKhaY5ReIJrBJdk0VnuEPI5JCiLSm9vhcGl/Rv4MUVIPjkaS5jzCNHLdGi1fDegugP8T+sfwqWqG2OiUS
 TZPBnhVBd9LzzeOwoi9w4pFAoDSJoLsw2SMd23RpXo7R+7uDdlsTdXD4z9uYcsBMyRUzARi2CjUj69hNWgFBtg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1738693611; bh=h72oXle1xrkTtOXsCP0LrTOjnaRpsnK++OO99TiIglU=;
 h=From:To:Subject:Date:MIME-Version;
 b=TWfIYrd7HQ00JKF+x2JQJJsgLWIRRVnNoNfudRY8CzuHP65ePBaFsBfd2w6SZFydn
 OkEisdUzPTrGI8ctROoEqLkR7Uq0lWv1aU0cUGRxWTZ69ikrgtgXWgJ7DjleAfYxuS
 ZeEsSVe03jshTWAMfWGH/AlLUaULgCt+2Cn7Qb+iNroF1md72Hyf9fM5En7XA0V15W
 2fKapzPld2JihdS9tfbGsLybE1z1hE6DFppmryVeby1+2uZ1djxTDJK/gmChNzRu0J
 3+h6mBBTkThQCASlUTW5AkeqonVnhgICKZNJlImrsbhrTgyLgUbB/PfZyaNxzdRcgK
 P5XMFZITUvDEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=TWfIYrd7
Subject: [Buildroot] [PATCH] package/rtl8821cu: bump to version 2025-01-21
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

With this version we can build with Linux 6.13.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index 41c39f5cff..f84be14b7c 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9ccac108553e0ddc35e030539e23c2151fc038f21c12a241b4df13e0c171ba5f  rtl8821cu-1597dfeda6cefd2e603fc7020ceca226d05fb108.tar.gz
+sha256  1f28db84937010a754ac84c21831fe06547f7add0be11f1c517cf7c81cf45fc7  rtl8821cu-96c65c58b544241178638e810b333dcc9aa26b91.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index faad054b3b..ee15910c7c 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = 1597dfeda6cefd2e603fc7020ceca226d05fb108
+RTL8821CU_VERSION = 96c65c58b544241178638e810b333dcc9aa26b91
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
