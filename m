Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5A8C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 19:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 276E270500;
	Fri,  7 Feb 2025 19:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jLhHfFMKXDe0; Fri,  7 Feb 2025 19:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3722F70515
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3722F70515;
	Fri,  7 Feb 2025 19:53:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 197881B7
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F13D44181F
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSTzNpvOaabF for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E0A940475
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E0A940475
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBD8F8718B; Fri,  7 Feb 2025 19:53:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Feb 2025 20:39:50 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: b191388f00ab415cf3b7516cc8554d222d37938b
X-Git-Newrev: 61f1fe83bfc078db2094951e5c22b09afd02e212
X-Patchwork-Hint: ignore
Message-Id: <20250207195347.EBD8F8718B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/glibc: drop bogus
 IGNORE_CVES entries
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

commit: https://git.buildroot.net/buildroot/commit/?id=61f1fe83bfc078db2094951e5c22b09afd02e212
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

When glibc was bumped from 2.39 to 2.40 in commit
74cb378aff231c4f4605d7f479b9ae1a7a4e1fb6 ("package/{glibc, localdef}:
bump to version 2.40"), the IGNORE_CVES entries should have been
dropped, as they were applicable to the 2.39 branch. Drop them now.

We did verify the pkg-stats output, and those CVEs don't show up as
affecting glibc even after this change, as expected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4b133efbd30ef2116b8f76663ef0bf1fcd1dbc42)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index cee03a16fd..d1f13ff0b6 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -24,18 +24,6 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
-# Fixed by glibc-2.39-31-g31da30f23cddd36db29d5b6a1c7619361b271fb4
-GLIBC_IGNORE_CVES += CVE-2024-2961
-
-# Fixed by glibc-2.39-35-g1263d583d2e28afb8be53f8d6922f0842036f35d
-GLIBC_IGNORE_CVES += CVE-2024-33599
-
-# Fixed by glibc-2.39-37-gc99f886de54446cd4447db6b44be93dabbdc2f8b
-GLIBC_IGNORE_CVES += CVE-2024-33600
-
-# Fixed by glibc-2.39-38-ga9a8d3eebb145779a18d90e3966009a1daa63cd
-GLIBC_IGNORE_CVES += CVE-2024-33601 CVE-2024-33602
-
 # All these CVEs are considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
