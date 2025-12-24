Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD709D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9631782306;
	Wed,  7 Jan 2026 18:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNsUy-sEwdB8; Wed,  7 Jan 2026 18:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F029082327
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808890;
	bh=y5bvnx1yNAIn5nBUqlzTK2ejuwY/mEjjyCbTS+rQb+g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r5CF+o5ob2EgA6kVon9HEFZgkO/+HMHR2KJaKSaVZl5BYziZ6bboHmkL8UvtSgIUO
	 KhFhkb8k4NgUa5N9UzjO4iywtzUEFDdmU4z5MkZRN5A5YB1zhihkJQw5u+SpuZRNKF
	 H8XvB067yBUBERSQ+EhB+3yC5PpnifA0nSSoxP2a9SuB5O/w1eBbkyw4YepDTiElkt
	 cYoOGiBoCu3uE84rwfFkM88VRHtDbb9MK28k6hos0S+4aVxBF/ZilSWT4yLOr07e0H
	 VfRoI4zxbJRSEvHGhCb4r+BEhdgQvjGTNSKwIslD0abX4hfJn1kODRiTLC8bvExuqG
	 9PqxvEbFYRb1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F029082327;
	Wed,  7 Jan 2026 18:01:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18009A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DB4E80EAE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vPqUiV1JZGE5 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A770D80AB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A770D80AB2
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 949B687C86; Wed,  7 Jan 2026 18:01:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Dec 2025 15:12:06 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 053eb1a9840e5ab019d9aab348772491ce7afcd7
X-Git-Newrev: 808cb9040341715468ad558691afd4228dcb9c56
X-Patchwork-Hint: ignore
Message-Id: <20260107180110.949B687C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/dropbear:
 security bump to version 2025.89
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=808cb9040341715468ad558691afd4228dcb9c56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Fixes CVE-2025-14282
https://security-tracker.debian.org/tracker/CVE-2025-14282
CVE-2019-6111 for scp
https://security-tracker.debian.org/tracker/CVE-2019-6111

Release notes:
https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2025.89

Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 700fcc48471a35dbb11530f818dd5068776ac831)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index b18aca3aab..b3f532b1b7 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256  783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4  dropbear-2025.88.tar.bz2
+sha256  0d1f7ca711cfc336dc8a85e672cab9cfd8223a02fe2da0a4a7aeb58c9e113634  dropbear-2025.89.tar.bz2
 
 # License file, locally computed
 sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index d57d6b6e37..e4e42cf994 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2025.88
+DROPBEAR_VERSION = 2025.89
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
