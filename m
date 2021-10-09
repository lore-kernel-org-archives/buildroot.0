Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C11C433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:04:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C97E60F5D
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 12:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C97E60F5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD81E80E90;
	Sat,  9 Oct 2021 12:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUynA56tkq1l; Sat,  9 Oct 2021 12:04:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30C1881C26;
	Sat,  9 Oct 2021 12:04:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1581BF95F
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D509837BC
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 12:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fLIcAVRpcFeC for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 12:02:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 763A383868
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 12:02:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B02D6935A0; Sat,  9 Oct 2021 12:00:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 13:51:24 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: c00da3ed1a94fc0f18bdda3b4fbf4af53d9e2895
X-Git-Newrev: b96d31a5644559b3a7882373621d6debfa175ab4
X-Patchwork-Hint: ignore
Message-Id: <20211009120015.B02D6935A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/squid: security
 bump to version 4.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=b96d31a5644559b3a7882373621d6debfa175ab4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fixes the following security issue:

- SQUID-2020:12 Out-Of-Bounds memory access in WCCPv2
  (CVE-2021-28116 aka ZDI-CAN-11610)

  Due to an out of bounds memory access Squid is vulnerable to an
  information leak vulnerability when processing WCCPv2 messages.

  This problem allows a WCCPv2 sender to corrupt Squids list of
  known WCCP routers and divert client traffic to attacker
  controlled routers.

  This attack is limited to Squid proxy with WCCPv2 enabled and
  IP spoofing of a router IP address configured as trusted in
  squid.conf.

For more details, see the advisory:
http://lists.squid-cache.org/pipermail/squid-announce/2021-October/000136.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6263c1f9a9a03bd9b1ce4c2ac7426f22e4ec8c60)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 12a9e5d293..b1a8feb78e 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.15.tar.xz.asc
-md5  a593de9dc888dfeca4f1f7db2cd7d3b9  squid-4.15.tar.xz
-sha1  60bda34ba39657e2d870c8c1d2acece8a69c3075  squid-4.15.tar.xz
+# From http://www.squid-cache.org/Versions/v4/squid-4.17.tar.xz.asc
+md5  47b94b2d27516f1764c9d5dc1b9645e5  squid-4.17.tar.xz
+sha1  f6bd15fabbd67b53a831fe9f67de3279868036c1  squid-4.17.tar.xz
 # Locally calculated
-sha256  b693a4e5ab2811a8a854f60de0a62afbbf3a952bb1d047952c9ae01321f84a25  squid-4.15.tar.xz
+sha256  cb928ac08c7c86b151b1c8f827abe1a84d83181a2a86e0d512286163e1e31418  squid-4.17.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 68eff82093..a30a87e20d 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.15
+SQUID_VERSION = 4.17
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
