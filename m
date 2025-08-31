Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019B6CA1000
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 15:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF0F580B4F;
	Sun, 31 Aug 2025 15:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5tEpfFhOFoS; Sun, 31 Aug 2025 15:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53824826BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53824826BB;
	Sun, 31 Aug 2025 15:01:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C023D278
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A69714090E
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfmYPCp97GWm for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 15:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04C1C408AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04C1C408AE
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 15:01:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F198987D65; Sun, 31 Aug 2025 15:01:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 31 Aug 2025 16:58:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2389965eaf8ba396f74e35d4558be79bf1e8c8a6
X-Git-Newrev: 7c47e8b1b2c1870c4281e30756fe2d44aa5c7e3a
X-Patchwork-Hint: ignore
Message-Id: <20250831150147.F198987D65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squid: bump to version 6.14
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7c47e8b1b2c1870c4281e30756fe2d44aa5c7e3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bufix release fixing a number of issues:

- Bug 5352: Do not get stuck in RESPMOD after pausing peer read(2)
- Bug 5489: Fix "make check" linking on Solaris
- Fix SNMP cacheNumObjCount -- number of cached objects
- Do not duplicate received Surrogate-Capability in sent requests
- Fix Mem::Segment::open() stub to fix build without shm_open()
- ... and CI and documentation updates

https://github.com/squid-cache/squid/releases/tag/SQUID_6_14

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 2 +-
 package/squid/squid.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index df52a3be16..329d61ca93 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  232e0567946ccc0115653c3c18f01e83f2d9cc49c43d9dead8b319af0b35ad52  squid-6.13.tar.xz
+sha256  9eafe06f58a199b918e79d33d8aa03afb9ae0c11d18974dca0b44c2669cab6dd  squid-6.14.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 4519a7d36e..b021170d9b 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 6.13
+SQUID_VERSION = 6.14
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = https://github.com/squid-cache/squid/releases/download/SQUID_$(subst .,_,$(SQUID_VERSION))
 SQUID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
