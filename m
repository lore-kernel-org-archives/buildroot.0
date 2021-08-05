Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50E8C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:04:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 672CB60FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 672CB60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CD9E82D49;
	Thu, 26 Aug 2021 22:04:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U_9l5Kks7w4h; Thu, 26 Aug 2021 22:04:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD4FF82ACD;
	Thu, 26 Aug 2021 22:04:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 227B01C1135
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C93B4077F
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzMXjauVDtrF for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3373340765
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 85E7A8DC52; Thu, 26 Aug 2021 22:01:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 22:32:52 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f24fb2382930f9bab25153085e69370e0a10d3bf
X-Git-Newrev: 9a4fbbac9c2c2e876ec6fafdab9c946e3f0a36df
X-Patchwork-Hint: ignore
Message-Id: <20210826220126.85E7A8DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libebml: fix patch
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=9a4fbbac9c2c2e876ec6fafdab9c946e3f0a36df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix patch added by commit 1116a3060955c36c43a8bea5f1f00ea4effb4e48

Fixes:
 - http://autobuild.buildroot.org/results/997d0d6204ad7a5456f25392257c8d876a1289ca

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...e-appropriate-header-files-for-std-numeric_limits.patch | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
index 83d1b92051..c7e789c02e 100644
--- a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
+++ b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] include appropriate header files for std::numeric_limits
 
 Fixes #80.
 
-[Retrieved from:
+[Retrieved (and updated to remove ChangeLog update) from:
 https://github.com/Matroska-Org/libebml/commit/f0bfd53647961e799a43d918c46cf3b6bff89806]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
@@ -14,18 +14,6 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  src/EbmlUnicodeString.cpp | 1 +
  3 files changed, 6 insertions(+)
 
-diff --git a/ChangeLog b/ChangeLog
-index 034cf86..e4b13a9 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,7 @@
-+2021-02-27  Moritz Bunkus  <mo@bunkus.online>
-+
-+        * Fix compilation with g++ 11. Fixes #80.
-+
- 2021-02-21 Steve Lhomme <slhomme@matroska.org>
- 
-         * Remove Coremake project files
 diff --git a/src/EbmlString.cpp b/src/EbmlString.cpp
 index 27e55fd..4c05fcf 100644
 --- a/src/EbmlString.cpp
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
