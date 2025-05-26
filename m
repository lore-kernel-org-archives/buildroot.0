Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA7CC5B552
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C63B83E4D;
	Sat, 31 May 2025 16:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Utzy51me72e; Sat, 31 May 2025 16:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1DB383E2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1DB383E2E;
	Sat, 31 May 2025 16:55:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22C31127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9896D401EA
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TmvCaTxKHaOK for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3D8A401FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3D8A401FC
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:55:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F238F87708; Sat, 31 May 2025 16:55:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 17:48:30 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 73dbdac4267ba0d0b5fbaff695e0eaf029c87927
X-Git-Newrev: 32c32c728ba7078d242718fd981235a95c2dc564
X-Patchwork-Hint: ignore
Message-Id: <20250531165509.F238F87708@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: include
 defconfigs in sub-directories in list-defconfigs
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

commit: https://git.buildroot.net/buildroot/commit/?id=32c32c728ba7078d242718fd981235a95c2dc564
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Currently, list-defconfigs only lists the defconfigs that live
 live in the top-level configs/ directory. For the in-tree defconfigs
this is indeed the case, but it is possible to manage the configs in a
br2-external tree with sub-directories.

A few examples:
  - for a given board, a first defconfig is the full system, and a
    second is the rescue system;
  - for a given board, two defconfigs implement an A/B feature set;
  - a set of configurations targetting various famillies of systems each
    running on different hardware, sorted per familly.

Extend list-defconfigs to look for and report defconfigs in
sub-directories of the top-level configs/.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 5009fd2436300383a50b3d23b80cdccd20c9d262)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 8c82107f6c..8d76b1ffe7 100644
--- a/Makefile
+++ b/Makefile
@@ -1218,7 +1218,7 @@ help:
 # $(2): br2-external name, empty for bundled
 define list-defconfigs
 	@first=true; \
-	for defconfig in $(1)/configs/*_defconfig; do \
+	for defconfig in $$(find $(1)/configs -name '*_defconfig' |sort); do \
 		[ -f "$${defconfig}" ] || continue; \
 		if $${first}; then \
 			if [ "$(2)" ]; then \
@@ -1228,7 +1228,7 @@ define list-defconfigs
 			fi; \
 			first=false; \
 		fi; \
-		defconfig="$${defconfig##*/}"; \
+		defconfig="$${defconfig#$(1)/configs/}"; \
 		printf "  %-35s - Build for %s\n" "$${defconfig}" "$${defconfig%_defconfig}"; \
 	done; \
 	$${first} || printf "\n"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
