Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252C0CAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 17:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0EAE841DD;
	Wed, 17 Sep 2025 17:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8hFYwfhnm-U; Wed, 17 Sep 2025 17:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47A948425B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47A948425B;
	Wed, 17 Sep 2025 17:33:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8B7EAF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24F274073B
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id myplbC8erhsr for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 17:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F6EB425AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F6EB425AE
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:33:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C68D8568A; Wed, 17 Sep 2025 17:33:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 19:32:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff492a2c87933305dc6e6aa72adf944c853bd983
X-Git-Newrev: 4ac3c1de5643f6b2f3d6f118313517d50d746ff3
X-Patchwork-Hint: ignore
Message-Id: <20250917173332.8C68D8568A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iputils: fix deprecated CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ac3c1de5643f6b2f3d6f118313517d50d746ff3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CPE 'iputils_project:iputils' has been deprecated in favour of
'iputils:iputils'.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 842fdb8478..8e00513229 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -8,7 +8,7 @@ IPUTILS_VERSION = 20250605
 IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
-IPUTILS_CPE_ID_VALID = YES
+IPUTILS_CPE_ID_VENDOR = iputils
 IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 # Selectively build binaries
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
