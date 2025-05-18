Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA21C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08B4E6FC39;
	Mon, 19 May 2025 11:05:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCkwqciIiNON; Mon, 19 May 2025 11:05:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 374FA711A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 374FA711A2;
	Mon, 19 May 2025 11:05:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4B6AD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B334141E63
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1jrwg6tO2Bo for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FD7142395
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FD7142395
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54AF382A2E; Mon, 19 May 2025 10:40:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:15:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 06afaf53473bfb5df273e6e70db2778d10224dd3
X-Git-Newrev: f88537c46b29c6159f62606b1a631dd5befb4fa2
X-Patchwork-Hint: ignore
Message-Id: <20250519104009.54AF382A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/busybox: drop stale
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

commit: https://git.buildroot.net/buildroot/commit/?id=f88537c46b29c6159f62606b1a631dd5befb4fa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

All of CVE-2023-42363, CVE-2023-42364, CVE-2023-42365, CVE-2023-42366
were fixed by patches that we no longer have since we bumped
Busybox. Those IGNORE_CVES entries are therefore no longer needed.

The CVE-2022-28391 ignore CVE entry is also reported as stale, but we
believe the NVD database is incorrect in saying this vulnerability
only affects Busybox up to 1.35.0. Indeed, Busybox 1.37.0 still
doesn't have the fixes and is therefore still affected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
