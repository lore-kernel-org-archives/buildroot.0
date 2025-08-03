Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EE4C87FCB
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 15:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8413F408FF;
	Sun,  3 Aug 2025 15:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEJ-KOJJRsX4; Sun,  3 Aug 2025 15:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A07EA4084D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A07EA4084D;
	Sun,  3 Aug 2025 15:36:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26B2E1A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0911260FDF
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8X9YKNx8YOA for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 15:36:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0525961014
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0525961014
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:36:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F240D86DF0; Sun,  3 Aug 2025 15:36:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Aug 2025 17:35:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6d1beddbcb1ea39b0eee3658132d409e6d9a312
X-Git-Newrev: 014174f00d358d38ddbb68d11a40a4d446b7e5cd
X-Patchwork-Hint: ignore
Message-Id: <20250803153604.F240D86DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: ignore CVE-2025-3277
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=014174f00d358d38ddbb68d11a40a4d446b7e5cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CVE-2025-3277 as been marked as a duplicate of CVE-2025-29087 by the
debian security tracker [1].

The CVE-2025-29087 has already been fixed in commit [2] so this patch
adds CVE-2025-3277 to the ignored CVEs.

[1] https://security-tracker.debian.org/tracker/CVE-2025-3277
[2] 835b5659ea package/sqlite: add patch to fix CVE-2025-29087

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
