Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F77C47258
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 10:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA482613EF;
	Wed, 10 Jan 2024 10:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA482613EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHV3X63Yr3i5; Wed, 10 Jan 2024 10:27:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2B02613EC;
	Wed, 10 Jan 2024 10:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2B02613EC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9B0B1BF94D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9253F41B35
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9253F41B35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cIXqRZkiFfxl for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3ABF4023E
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3ABF4023E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A16885536; Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 11:07:15 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 105ce13d2165a03ef821256d56f772fed8f301f1
X-Git-Newrev: 573f5a6f7241c804a2d909520908df35fea2a55f
X-Patchwork-Hint: ignore
Message-Id: <20240110102650.9A16885536@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/squid: security
 bump to version 6.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=573f5a6f7241c804a2d909520908df35fea2a55f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

- Drop patch (already in version)
- Fix CVE-2023-50269: This problem allows a remote client to perform
  Denial of Service attack by sending a large X-Forwarded-For header
  when the follow_x_forwarded_for feature is configured.

https://github.com/squid-cache/squid/security/advisories/GHSA-wgq4-4cfg-c4x3
https://github.com/squid-cache/squid/blob/SQUID_6_6/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c13199c9326fa2daa574f08ec8fc063a48d0eb06)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index a163bd9ad3..4a8ea5d550 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v6/squid-6.5.tar.xz.asc
-md5  da2797d899cf538fab7f504fdf3c18bf  squid-6.5.tar.xz
-sha1  07a08394625948750264778c82e19cf24ea7cb1f  squid-6.5.tar.xz
+# From http://www.squid-cache.org/Versions/v6/squid-6.6.tar.xz.asc
+md5  5a41134ee1b7e75f62088acdec92d2ca  squid-6.6.tar.xz
+sha1  f05e06a9dd3bf7501d2844e43d9ae1bd00e9edcc  squid-6.6.tar.xz
 # Locally calculated
-sha256  5070f8a3ae6666870c8fc716326befb0a1abe8b5ff3a6f3932cbc5543d7c8549  squid-6.5.tar.xz
+sha256  55bd7f9f4898153161ea1228998acb551bf840832b9e5b90fc8ecd2942420318  squid-6.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index c1477b1adf..3a9edac71e 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 6.5
+SQUID_VERSION = 6.6
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v6
 SQUID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
