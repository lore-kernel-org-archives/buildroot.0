Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB5FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 12:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5859341E3F;
	Thu, 31 Mar 2022 12:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXa_cTPK7TEr; Thu, 31 Mar 2022 12:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1890441E1E;
	Thu, 31 Mar 2022 12:15:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AF6B1C115D
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 12:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A2DD83336
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 12:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RYPyS92Mho78 for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 12:15:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4701B8336F
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 12:15:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 454CC8608A; Thu, 31 Mar 2022 12:06:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 14:15:06 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: e8d1f9e2bfce5b766f0a69c9d89c03658d9d5d0f
X-Git-Newrev: ff8555763aa51a43a108dccf4011406bce2d00d2
X-Patchwork-Hint: ignore
Message-Id: <20220331120606.454CC8608A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/matio: security
 bump to version 1.5.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff8555763aa51a43a108dccf4011406bce2d00d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

- Fixed heap-based buffer overflows when reading (crafted) MAT file
  (CVE-2020-36428, CVE-2021-36977)
- Update hash of COPYING (year updated and contributors added:
  https://github.com/tbeu/matio/commit/a3730c09797372a5919140b4618f217bb54bd1a1)

https://github.com/tbeu/matio/releases/tag/v1.5.22

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f33260685bf9dedd76db5b19f2dce0f4b5cbce2b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/matio/matio.hash | 6 +++---
 package/matio/matio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/matio/matio.hash b/package/matio/matio.hash
index 4dd05dee07..4634074ca0 100644
--- a/package/matio/matio.hash
+++ b/package/matio/matio.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/projects/matio/files/matio/1.5.21/
-sha512  b00bcad807e6a7e10afa656eb77a0e3e9fb08d9cecc3e94ba41ef91ce60367d6686e6d387a874bbb83eb2f895d4a97caac554a70e7f5f6f5cb750052702d411c  matio-1.5.21.tar.gz
+# From https://sourceforge.net/projects/matio/files/matio/1.5.22/
+sha512  33fd3991413e94dfc9aba13ffd08b09ddcbdb9dfa579124d981449e195a8c61a3dc95b55e46bba360d48456c117cf36403af1c3448689c26b8aea5fa9cf38323  matio-1.5.22.tar.gz
 # Locally computed
-sha256  69143d4a8f1933022bb909327df1ce812dd2420ed57949812dd8f370856bf2a1  COPYING
+sha256  3ed9a50d754fcc92d4accb8448e397eafeab686796b2a7445557ce782806e239  COPYING
diff --git a/package/matio/matio.mk b/package/matio/matio.mk
index 236466d4d9..d282852d37 100644
--- a/package/matio/matio.mk
+++ b/package/matio/matio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MATIO_VERSION = 1.5.21
+MATIO_VERSION = 1.5.22
 MATIO_SITE = http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
 MATIO_LICENSE = BSD-2-Clause
 MATIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
