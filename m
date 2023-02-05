Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B48C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 17:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01CFF4018E;
	Sun,  5 Feb 2023 17:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01CFF4018E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKwdoLJuuSEM; Sun,  5 Feb 2023 17:09:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42E564017A;
	Sun,  5 Feb 2023 17:09:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42E564017A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54F181BF3EE
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 17:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B787B414C9
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 17:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B787B414C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ooiNiHsLfIch for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 17:09:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7411409B4
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 17:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7411409B4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3A01838DD; Sun,  5 Feb 2023 17:09:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 18:08:25 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0683331971cf50ce7b071278e0ecd05253fffe51
X-Git-Newrev: 89c63ae8724354fada0894792b1bde0eb9e57759
X-Patchwork-Hint: ignore
Message-Id: <20230205170914.C3A01838DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libgit2: bump
 version to 1.4.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=89c63ae8724354fada0894792b1bde0eb9e57759
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

git added restrictions on config files to fix CVE 2022-24765.  libgit2
adopted these changes for compatibility reasons, even if the vuln is
not exploitable in libgit2.

https://github.com/libgit2/libgit2/releases/tag/v1.4.3

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 01ee7f84fb9da338d36fbaad3cf8a07391a843d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index ada411ea22..3b5837f789 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  901c2b4492976b86477569502a41c31b274b69adc177149c02099ea88404ef19  libgit2-1.4.2.tar.gz
+sha256  f48b961e463a9e4e7e7e58b21a0fb5a9b2a1d24d9ba4d15870a0c9b8ad965163  libgit2-1.4.3.tar.gz
 sha256  0092f24acc306ee3287dc05b5e85cb9e0e48cd3f11c60c4625b1a673a5912616  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index e94dd9c370..3f1e6e1593 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.4.2
+LIBGIT2_VERSION = 1.4.3
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = GPL-2.0 with linking exception, MIT (sha1), wildmatch license (wildmatch), CC0-1.0 (xoroshiro256)
 LIBGIT2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
