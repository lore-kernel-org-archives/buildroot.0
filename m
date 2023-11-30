Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1415FC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B409D4365B;
	Thu, 30 Nov 2023 23:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B409D4365B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eJmpn-1OYwsI; Thu, 30 Nov 2023 23:07:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75A834366F;
	Thu, 30 Nov 2023 23:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75A834366F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 040061BF844
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06C0541F5D
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06C0541F5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NrQDctcUQ3Aj for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:04:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1FEF41F3B
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1FEF41F3B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2FA98766A; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:50:21 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: dbf8a45bb340a0494ac7f3f274644c5e0a1bc594
X-Git-Newrev: d8feeaa04779bbf3fc0e3ba0c44c826781803ac2
X-Patchwork-Hint: ignore
Message-Id: <20231130230401.A2FA98766A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/squid: security
 bump to version 6.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8feeaa04779bbf3fc0e3ba0c44c826781803ac2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix CVE-2023-5824, CVE-2023-46724, CVE-2023-46846, CVE-2023-46847 and
CVE-2023-46848

https://github.com/squid-cache/squid/security/advisories/GHSA-543m-w2m2-g255
https://github.com/squid-cache/squid/security/advisories/GHSA-j83v-w3p4-5cqh
https://github.com/squid-cache/squid/security/advisories/GHSA-73m6-jm96-c6r3
https://github.com/squid-cache/squid/security/advisories/GHSA-phqj-m8gv-cq4g
https://github.com/squid-cache/squid/security/advisories/GHSA-2g3c-pg7q-g59w

https://github.com/squid-cache/squid/blob/SQUID_6_5/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7fb3c96a7b4bfab1272991a997d6b507b38d19c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index a6d4c5d056..a163bd9ad3 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v6/squid-6.3.tar.xz.asc
-md5  2512b5d27856e6f91a97719784506893  squid-6.3.tar.xz
-sha1  7bd74034015c6a4d345a4d277a431908bed2ec4a  squid-6.3.tar.xz
+# From http://www.squid-cache.org/Versions/v6/squid-6.5.tar.xz.asc
+md5  da2797d899cf538fab7f504fdf3c18bf  squid-6.5.tar.xz
+sha1  07a08394625948750264778c82e19cf24ea7cb1f  squid-6.5.tar.xz
 # Locally calculated
-sha256  74a0f5586a7a5d89573d502708d5e1d66ddf0430cf4802cc7261b765653248fa  squid-6.3.tar.xz
+sha256  5070f8a3ae6666870c8fc716326befb0a1abe8b5ff3a6f3932cbc5543d7c8549  squid-6.5.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 019a202952..c1477b1adf 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 6.3
+SQUID_VERSION = 6.5
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v6
 SQUID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
