Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84583C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 16:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 177C1404BB;
	Sat,  5 Nov 2022 16:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 177C1404BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1APbSLn4kM76; Sat,  5 Nov 2022 16:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A6BE404D3;
	Sat,  5 Nov 2022 16:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A6BE404D3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC29A1BF38C
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 16:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A81F940471
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 16:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A81F940471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rEtwNo7UfpW3 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 16:47:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB40440148
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 16:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB40440148
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3EAA87AF7; Sat,  5 Nov 2022 16:47:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 17:46:53 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: e8cccbb50ce5a754f81c2abc64da331577cfce7e
X-Git-Newrev: bb070db122ad702b1fdfba596d8e90fbc7835ffb
X-Patchwork-Hint: ignore
Message-Id: <20221105164744.C3EAA87AF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/squid: security
 bump to version 5.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb070db122ad702b1fdfba596d8e90fbc7835ffb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security issues:

- CVE-2022-41317: Exposure of Sensitive Information in Cache Manager
  https://www.openwall.com/lists/oss-security/2022/09/23/1

- CVE-2022-41318: Buffer Over Read in SSPI and SMB Authentication
  https://www.openwall.com/lists/oss-security/2022/09/23/2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e6c9a95a34eec997168780d9049560f26cfaeb60)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 22c6db8c70..b00d14011e 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v5/squid-5.6.tar.xz.asc
-md5  2f2201a18a0a727ab589d951ebe4f815  squid-5.6.tar.xz
-sha1  a01f47b3e9ff06245c894773de30bfd88ab14f65  squid-5.6.tar.xz
+# From http://www.squid-cache.org/Versions/v5/squid-5.7.tar.xz.asc
+md5  7a3764a3c5833631a779d7827901cda7  squid-5.7.tar.xz
+sha1  141e8007d6b1cfee34654127a9ca025125b37b58  squid-5.7.tar.xz
 # Locally calculated
-sha256  38d27338a347597ce0e93d0c3be6e5f66b6750417c474ca87ee0d61bb6d148db  squid-5.6.tar.xz
+sha256  6b0753aaba4c9c4efd333e67124caecf7ad6cc2d38581f19d2f0321f5b7ecd81  squid-5.7.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 86a0c714c6..355af0b902 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 5.6
+SQUID_VERSION = 5.7
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v5
 SQUID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
