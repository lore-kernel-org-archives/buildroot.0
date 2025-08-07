Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AAEC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AD7D60725;
	Thu,  7 Aug 2025 17:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8wSu_8QoCrF; Thu,  7 Aug 2025 17:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D03FE606E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D03FE606E3;
	Thu,  7 Aug 2025 17:01:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D774233
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CBDA80BD5
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1ZqYTA9ZyL2 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2488D80BD3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2488D80BD3
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22A2F86C99; Thu,  7 Aug 2025 17:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 12:21:45 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 52f03f832fe073f90e67e93fb82a93f5d248319c
X-Git-Newrev: a14782706ab798a8d7facbe89561a8c88e4beb69
X-Patchwork-Hint: ignore
Message-Id: <20250807170024.22A2F86C99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sqlite: ignore
 CVE-2025-3277
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

commit: https://git.buildroot.net/buildroot/commit/?id=a14782706ab798a8d7facbe89561a8c88e4beb69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The CVE-2025-3277 as been marked as a duplicate of CVE-2025-29087 by the
debian security tracker [1].

The CVE-2025-29087 has already been fixed in commit [2] so this patch
adds CVE-2025-3277 to the ignored CVEs.

[1] https://security-tracker.debian.org/tracker/CVE-2025-3277
[2] 835b5659ea package/sqlite: add patch to fix CVE-2025-29087

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 014174f00d358d38ddbb68d11a40a4d446b7e5cd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sqlite/sqlite.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 037b89918a..4f4bc9d3af 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -14,7 +14,7 @@ SQLITE_CPE_ID_VENDOR = sqlite
 SQLITE_INSTALL_STAGING = YES
 
 # 0002-Add-a-typecast-to-avoid-32-bit-integer-overflow-in-t.patch
-SQLITE_IGNORE_CVES = CVE-2025-29087
+SQLITE_IGNORE_CVES = CVE-2025-29087 CVE-2025-3277
 
 ifeq ($(BR2_PACKAGE_SQLITE_STAT4),y)
 SQLITE_CFLAGS += -DSQLITE_ENABLE_STAT4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
