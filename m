Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB48C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D98AB4366F;
	Thu, 30 Nov 2023 23:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D98AB4366F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lAqsPTWZnOmG; Thu, 30 Nov 2023 23:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEF6C4365B;
	Thu, 30 Nov 2023 23:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEF6C4365B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04F071BF844
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA53641F96
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA53641F96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uY0rrh193HeA for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AAEE41EE7
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AAEE41EE7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87A048766A; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:50:10 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: cfaac7f0a08fddd9a7b83eabdd3e679c9c0b1c1e
X-Git-Newrev: 48428b07ad77d693e6546d42c2f04688821a9297
X-Patchwork-Hint: ignore
Message-Id: <20231130230401.87A048766A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/squid: update to
 6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=48428b07ad77d693e6546d42c2f04688821a9297
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

See the release notes for Squid 6 for any news:
http://www.squid-cache.org/Versions/v6/RELEASENOTES.html

Tested with qemu_aarch64_virt_defconfig.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2a7c6816f02f45946e896577d78e3470331b2d63)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index b00d14011e..ec60a0e9d1 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v5/squid-5.7.tar.xz.asc
-md5  7a3764a3c5833631a779d7827901cda7  squid-5.7.tar.xz
-sha1  141e8007d6b1cfee34654127a9ca025125b37b58  squid-5.7.tar.xz
+# From http://www.squid-cache.org/Versions/v6/squid-6.2.tar.xz.asc
+md5  ad01b7d82b6a00ffd8cd39b97113d05a  squid-6.2.tar.xz
+sha1  29ddb4c522a36f1270e7cfa66f0dec8805fd2b57  squid-6.2.tar.xz
 # Locally calculated
-sha256  6b0753aaba4c9c4efd333e67124caecf7ad6cc2d38581f19d2f0321f5b7ecd81  squid-5.7.tar.xz
+sha256  dd759e151e997d31786d91743d327b1b4b532f1caea66bf81100ec8ba04ec4c1  squid-6.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 355af0b902..167e9f67d8 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQUID_VERSION = 5.7
+SQUID_VERSION = 6.2
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
-SQUID_SITE = http://www.squid-cache.org/Versions/v5
+SQUID_SITE = http://www.squid-cache.org/Versions/v6
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 SQUID_CPE_ID_VENDOR = squid-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
