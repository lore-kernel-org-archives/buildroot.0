Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D59C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 10 Aug 2024 09:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C89D18415D;
	Sat, 10 Aug 2024 09:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aW8DZcwhZ82E; Sat, 10 Aug 2024 09:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EE8B8448E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EE8B8448E;
	Sat, 10 Aug 2024 09:53:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10EF61BF5F8
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 09:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AB86605A8
 for <buildroot@lists.busybox.net>; Sat, 10 Aug 2024 09:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sARJ8nppBaYC for <buildroot@lists.busybox.net>;
 Sat, 10 Aug 2024 09:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87967605A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87967605A9
 for <buildroot@buildroot.org>; Sat, 10 Aug 2024 09:53:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7706D84A77; Sat, 10 Aug 2024 09:53:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Aug 2024 10:47:09 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: d3b6f8fa3cbc9c245c85a0963a8b446455f15e6c
X-Git-Newrev: 8a6b86756843df35ce103423188a55eb80bb255c
X-Patchwork-Hint: ignore
Message-Id: <20240810095326.7706D84A77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/squid: bump
 version to 6.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a6b86756843df35ce103423188a55eb80bb255c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

The ESI feature is now disabled by default. Use --enable-esi if needed.

See here for other changes:
https://github.com/squid-cache/squid/commits/v6

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4c1a85a87d5aabfc2a4ec99da7c48df9f1884797)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
