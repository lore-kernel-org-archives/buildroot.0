Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4649AECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7817416DD;
	Sat, 27 Aug 2022 07:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7817416DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Th9ncr5RbYOb; Sat, 27 Aug 2022 07:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CBDA410BC;
	Sat, 27 Aug 2022 07:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CBDA410BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 572D51BF267
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 304BD4179E
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 304BD4179E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fO-3pqDh2e2e for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:59:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B76C410BA
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B76C410BA
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F3A8987D51; Sat, 27 Aug 2022 07:44:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 09:58:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 408888a29b97cd6f89b528966d853f486149f6d5
X-Git-Newrev: d3ef301f0c2d339eade3188e2a80ff8841ea935f
X-Patchwork-Hint: ignore
Message-Id: <20220827074408.F3A8987D51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squid: security bump to version 5.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3ef301f0c2d339eade3188e2a80ff8841ea935f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-46784: In Squid 3.x through 3.5.28, 4.x through 4.17, and
5.x before 5.6, due to improper buffer management, a Denial of Service
can occur when processing long Gopher server responses.

https://github.com/squid-cache/squid/security/advisories/GHSA-f5cp-6rh3-284w

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index e18ed8961e..22c6db8c70 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v5/squid-5.3.tar.xz.asc
-md5  9249f30169ab6600e53b4f9b8129b3b0  squid-5.3.tar.xz
-sha1  d3a8310c725616fa7565d60f3bf8fdf5fa20b15a  squid-5.3.tar.xz
+# From http://www.squid-cache.org/Versions/v5/squid-5.6.tar.xz.asc
+md5  2f2201a18a0a727ab589d951ebe4f815  squid-5.6.tar.xz
+sha1  a01f47b3e9ff06245c894773de30bfd88ab14f65  squid-5.6.tar.xz
 # Locally calculated
-sha256  45178588df1311ded41ebadd632840c4d93a8d7f5f60e38e74acf2f1ae2f1715  squid-5.3.tar.xz
+sha256  38d27338a347597ce0e93d0c3be6e5f66b6750417c474ca87ee0d61bb6d148db  squid-5.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 3847fb49dc..86a0c714c6 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 5.3
+SQUID_VERSION = 5.6
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v5
 SQUID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
