Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E052C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85ADB85A8D;
	Fri, 28 Feb 2025 17:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6H2EkuWm84g; Fri, 28 Feb 2025 17:11:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F9A185A83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F9A185A83;
	Fri, 28 Feb 2025 17:11:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C14C68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8347C4156C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ewcx3ea0a13 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50FFB42F5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50FFB42F5B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BE3286A4C; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 12:27:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aadac609aa49e9b0c809c6a912097eaa4bbf9c3b
X-Git-Newrev: 4b133efbd30ef2116b8f76663ef0bf1fcd1dbc42
X-Patchwork-Hint: ignore
Message-Id: <20250228163029.4BE3286A4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/glibc: drop bogus
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b133efbd30ef2116b8f76663ef0bf1fcd1dbc42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When glibc was bumped from 2.39 to 2.40 in commit
74cb378aff231c4f4605d7f479b9ae1a7a4e1fb6 ("package/{glibc, localdef}:
bump to version 2.40"), the IGNORE_CVES entries should have been
dropped, as they were applicable to the 2.39 branch. Drop them now.

We did verify the pkg-stats output, and those CVEs don't show up as
affecting glibc even after this change, as expected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index e026c18762..25e28c7cf6 100644
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
