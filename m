Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFD4CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 06:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D081D41EBE;
	Fri, 29 May 2026 06:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0P-mA2Xwwton; Fri, 29 May 2026 06:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13F2941EB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780037886;
	bh=fSRdv0ZkKHWz4JzRDdkj9OxHp3iOr/9Y4Uus9/Kk6j0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jKKtbE8lnJVQRYb++9HPTK+TpDnHTLYhizGoM/susfhIO0h2jhYsB0PhDFe5W1kLW
	 W9d92vKPGkJM+C0wMTnw0R0uxcLBhrtuzKPWSMPLZ877HtP1s8ptAypNOUpVBIcJVC
	 ZQC5ZNNvTjUoLJ0Qrjdt7akkUgPghpfUjwNSztYUx3bBMdmXYVoan3M6UA1R/pR02L
	 vfARTMiPdM4Ls/7jDuW5HbCqiE0TYpR41PK4+F1rviaa/BsxlIedglgx6MXCbQf8MT
	 c44EV14sumUs/iV/wU5NM72vkvM1pX8Q7JzKK7P5NGGtTuneZzrCEV66KGD/74OP3U
	 t+25eSStWUGvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13F2941EB9;
	Fri, 29 May 2026 06:58:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71A4828E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 06:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5276041EB7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 06:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqRQNVI-MrYr for <buildroot@buildroot.org>;
 Fri, 29 May 2026 06:58:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9029841EB6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9029841EB6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 06:58:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23B7D873A0; Fri, 29 May 2026 06:57:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 08:55:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5aef8a047cf83e70868174da22891edd603003b
X-Git-Newrev: e5a723f35d57d25a084a9e907e07d281cb17d3c0
X-Patchwork-Hint: ignore
Message-Id: <20260529065751.23B7D873A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic: Add
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e5a723f35d57d25a084a9e907e07d281cb17d3c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This is the file the original commit d8898380984f ("package/pkg-generic.mk:
Remove Info documents dir entry") wanted to delete.

However, it only works for host packages. Target packages are (usually)
installed with prefix /usr, so the info dir is /usr/share/info. Simply
remove both of them, even if one of them only exists for host packages
and the other only for target packages.

Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index dd440e4062..83f3506913 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -863,7 +863,7 @@ endif
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
