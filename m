Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F75C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 21:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 346B782075;
	Sat, 25 Mar 2023 21:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 346B782075
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xZqSjud4kKKM; Sat, 25 Mar 2023 21:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8621481FFB;
	Sat, 25 Mar 2023 21:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8621481FFB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DD1E1BF39A
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97C9D81E5A
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97C9D81E5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qb2rm3yx9ndx for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E1EF81DED
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E1EF81DED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CCD882AA8; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 21:47:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 323abee789c7f63db3df14a235b3106e7adab4ba
X-Git-Newrev: b75e7dc15a682f73832384e7116a6c36dca0acee
X-Patchwork-Hint: ignore
Message-Id: <20230325210739.5CCD882AA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dc3dd: migrate to new autopoint
 flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=b75e7dc15a682f73832384e7116a6c36dca0acee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
[Arnout: also update comment]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/dc3dd/dc3dd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
index cc89bb63d0..f47f34a81a 100644
--- a/package/dc3dd/dc3dd.mk
+++ b/package/dc3dd/dc3dd.mk
@@ -11,8 +11,8 @@ DC3DD_SITE = https://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSI
 DC3DD_LICENSE = GPL-3.0+
 DC3DD_LICENSE_FILES = COPYING
 # We are patching Makefile.am, so we need to autoreconf. We also need to
-# enable gettextize as dc3dd comes with an old gettext infra.
+# enable autopoint as dc3dd comes with an old gettext infra.
 DC3DD_AUTORECONF = YES
-DC3DD_GETTEXTIZE = YES
+DC3DD_AUTOPOINT = YES
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
