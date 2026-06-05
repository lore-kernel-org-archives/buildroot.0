Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9BCCD6E74
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42AED608D7;
	Fri,  5 Jun 2026 12:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAm8Vw0v94_M; Fri,  5 Jun 2026 12:46:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AABA608DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663615;
	bh=h8U29lKXlKEcBfNuFHGTX8YgMafES3vp0Xox3GsyqKI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k4eNYGNzCbLZmRuFG+d5LPGlk3NjyiZmFMx3B8W0yjTdB+jY5uYRctenewzoOSzUE
	 YKSWpdX7vajwPrTIG2w0AKwO0LfBhw1LJDnMRayk/P6UpvY6hXDGfcyKxoG2xnw5ji
	 c+V8iYp8/mjBFl0sIiILHk9mLZP4skw77PsLhOJdcpkKWdoziPld7isKg5pVeWSsYL
	 kh57wvQCM2nd32PiUsFgugZeq63ItNLQYiOehHAbVRwGDmJyAuTTyju9nvCg97zQzL
	 aeu5uEnsXr9hKV/B6C/I9y8rjpI5AFfpBg32vMh1O7sVN2NIaVjKT6jJa7+r/ODN/O
	 s6aMHo9RIcbXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AABA608DA;
	Fri,  5 Jun 2026 12:46:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62FB4388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A0D2608DA
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LDNs-vPtBxO for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:46:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22C77608D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22C77608D7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:46:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F0F487B3F; Fri,  5 Jun 2026 12:46:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jun 2026 14:40:14 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 94334f9d207d0fbe50d92e64669082538ca2442d
X-Git-Newrev: a20dafe5c190a7d083de3c1a219f27aff7450ebb
X-Patchwork-Hint: ignore
Message-Id: <20260605124636.3F0F487B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pkg-generic: Add
 /usr/share/info/dir to $(2)_DROP_FILES_OR_DIRS
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a20dafe5c190a7d083de3c1a219f27aff7450ebb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This is the file the original commit d8898380984f ("package/pkg-generic.mk:
Remove Info documents dir entry") wanted to delete.

However, it only works for host packages. Target packages are (usually)
installed with prefix /usr, so the info dir is /usr/share/info. Simply
remove both of them, even if one of them only exists for host packages
and the other only for target packages.

Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit e5a723f35d57d25a084a9e907e07d281cb17d3c0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f2b1c375d2..7d808ea834 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -870,7 +870,7 @@ endif
 endif
 
 # Globally remove following conflicting and useless files
-$(2)_DROP_FILES_OR_DIRS += /share/info/dir
+$(2)_DROP_FILES_OR_DIRS += /share/info/dir /usr/share/info/dir
 
 ifeq ($$($(2)_TYPE),host)
 $(2)_POST_INSTALL_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_HOST
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
