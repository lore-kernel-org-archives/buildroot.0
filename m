Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AB8CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A598E60F14;
	Fri, 12 Jun 2026 11:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffEpV0RgH8nb; Fri, 12 Jun 2026 11:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AF4560F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263349;
	bh=VtC/ZTqWGlFNgjCHnjFsAQFAx5wXdkgHlDzLRScBlnw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dM7mXpGjKsWxwTfF8xr1q579Yav88it2CDeb5BrXHJytQ8CMs6WscH9u1y0oTIJu0
	 Hp5IG7Xucd6831aojlPRlTlWA+KIYlrPPBmorriyU/WwyNj6CJPk18pFAt3N10rF6Q
	 +AMTYXT9PmBS9V6hXlLsHWJnykyqfArlgLSpt+Q+ClrNUDAjYLelpD98agDWvwj+pq
	 7854UsFPWRfcPs7/8kiXLgaCDlzDJhSRIlGAWjL/J3uLrmTVFmHhKmBMaUVhNznOLu
	 Y042tuZ/nV0MoRawTBnACcMOIEiePvaqxlw3MM7gLB8V+/j3M5rrX3r8Hy3TlruOju
	 ebHIbQQJJFEjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AF4560F25;
	Fri, 12 Jun 2026 11:22:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBF33F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDE4460F0C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5thTAN5_UeRs for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D140F60EF7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D140F60EF7
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E7CC880D5; Fri, 12 Jun 2026 11:22:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:17:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0100b767a503a6baee4540c1580c0e809a5cc5ed
X-Git-Newrev: f5dfe087eea4352e21b56f16059217b6bc35ebf2
X-Patchwork-Hint: ignore
Message-Id: <20260612112203.9E7CC880D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tor: security
 bump version to 0.4.9.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f5dfe087eea4352e21b56f16059217b6bc35ebf2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.9/ReleaseNotes

Fixes
TROVE-2026-013, TROVE-2026-014, TROVE-2026-015, TROVE-2026-016,
TROVE-2026-017, TROVE-2026-018, TROVE-2026-019, TROVE-2026-020,
TROVE-2026-021 & TROVE-2026-022.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f9a9f240c1de99ca9607c378be43f154f0abc282)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index f748afecfc..a6771b1fa1 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.9.8.tar.gz.sha256sum
-sha256  ac1f394e2dd2ab0877d27d928fd0d9e86662fe3ca6afdffb9fd9b6f0f96d05de  tor-0.4.9.8.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.9.tar.gz.sha256sum
+sha256  bd75ba7fd68f607c7806fcf70156a300aa926e9ad69a5e56a8e6414f5227e833  tor-0.4.9.9.tar.gz
 # Locally computed
 sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index a24708ddad..ca5a4d026c 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.9.8
+TOR_VERSION = 0.4.9.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
