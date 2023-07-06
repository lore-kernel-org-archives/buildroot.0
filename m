Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB549EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 09:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CD6140313;
	Thu,  6 Jul 2023 09:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CD6140313
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zYoAc5jSrCr1; Thu,  6 Jul 2023 09:25:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A129E408B4;
	Thu,  6 Jul 2023 09:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A129E408B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 150D61BF3EB
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 09:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC68A40900
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 09:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC68A40900
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yY5efJTEubxR for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 09:25:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30BBC402D8
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 09:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30BBC402D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A2C9867D4; Thu,  6 Jul 2023 09:25:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 11:23:57 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 91c51b76c7b6b190751bd3b3a18adc1d0d3db142
X-Git-Newrev: ba378b79b241381b74800262373c1c85db91d233
X-Patchwork-Hint: ignore
Message-Id: <20230706092513.1A2C9867D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/ghostscript:
 security bump version to 10.01.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba378b79b241381b74800262373c1c85db91d233
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Switch tarball to .xz

Fixes CVE-2023-28879:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2023-28879

Release notes:
https://ghostscript.readthedocs.io/en/latest/News.html?utm_source=ghostscript&utm_medium=website&utm_content=inline-link

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1116fd46a477c58472e98b797dc67c96020883e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index ca26a38a02..30c45a5a74 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9561/SHA512SUMS
-sha512  f498384af80654c040635564b8bc9a64c4bb5b0769bb00aade4042bbe9117c482362dc1a1fac72db3ce9487dd5a5bb8fb81b35b360680fe598df33dfbbe79499  ghostscript-9.56.1.tar.gz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10011/SHA512SUMS
+sha512  d944be9e8aef68d1176d64c40db6fa86d55d0c9e30047f2147c02806ab61cfe9ac2cb00d4e5b218ff3c51cc6ed47ceffe1bac4dd9d4cc1760b7974f30c6c2735  ghostscript-10.01.1.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 364fa1469a..d215afccd2 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 9.56.1
+GHOSTSCRIPT_VERSION = 10.01.1
+GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
