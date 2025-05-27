Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8E2C5B552
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D985960E50;
	Wed,  4 Jun 2025 18:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btznABuj99k2; Wed,  4 Jun 2025 18:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 124CF61561
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 124CF61561;
	Wed,  4 Jun 2025 18:28:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 136C5DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E925940112
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9K_9G3Q91gdL for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAA084005B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAA084005B
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB12B876DC; Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:25:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c07f2fb05108a0b0ddc3c36a9484fc110479e5ec
X-Git-Newrev: ae3119bc05e49da615be480a26ae01d6e412f1eb
X-Patchwork-Hint: ignore
Message-Id: <20250604182757.AB12B876DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/busybox: drop
 stale IGNORE_CVES entries
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae3119bc05e49da615be480a26ae01d6e412f1eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

All of CVE-2023-42363, CVE-2023-42364, CVE-2023-42365, CVE-2023-42366
were fixed by patches that we no longer have since we bumped
Busybox. Those IGNORE_CVES entries are therefore no longer needed.

The CVE-2022-28391 ignore CVE entry is also reported as stale, but we
believe the NVD database is incorrect in saying this vulnerability
only affects Busybox up to 1.35.0. Indeed, Busybox 1.37.0 still
doesn't have the fixes and is therefore still affected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f88537c46b29c6159f62606b1a631dd5befb4fa2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/busybox/busybox.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d3074d2218..532932ec8f 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,16 +15,6 @@ BUSYBOX_CPE_ID_VENDOR = busybox
 # 0004-nslookup-sanitize-all-printed-strings-with-printable.patch
 BUSYBOX_IGNORE_CVES += CVE-2022-28391
 
-# 0012-awk-fix-use-after-free-CVE-2023-42363.patch
-BUSYBOX_IGNORE_CVES += CVE-2023-42363
-
-# 0013-awk-fix-precedence-of-relative-to.patch
-# 0014-awk-fix-ternary-operator-and-precedence-of.patch
-BUSYBOX_IGNORE_CVES += CVE-2023-42364 CVE-2023-42365
-
-# 0015-awk.c-fix-CVE-2023-42366-bug-15874.patch
-BUSYBOX_IGNORE_CVES += CVE-2023-42366
-
 BUSYBOX_CFLAGS = \
 	$(TARGET_CFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
