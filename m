Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90575C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 15:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 467AE40B47;
	Tue,  7 Jun 2022 15:05:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O_GKtFlX6BP8; Tue,  7 Jun 2022 15:05:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D88C40B31;
	Tue,  7 Jun 2022 15:05:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 778381BF39F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6685C40602
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AFYuvWD3KRHs for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 15:04:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1DD440162
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 15:04:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 10A7086C47; Tue,  7 Jun 2022 14:53:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 17:03:24 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2079d5996b21e838414b2e1db20a9044eb48068f
X-Git-Newrev: 6208ab73460c50a164dc205def544c9627c90ea6
X-Patchwork-Hint: ignore
Message-Id: <20220607145306.10A7086C47@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] manual: add
 _TARGET_FINALIZE_HOOKS in the list of hooks
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

commit: https://git.buildroot.net/buildroot/commit/?id=6208ab73460c50a164dc205def544c9627c90ea6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

While reading the docs to find hooks, I completely missed the
LIBFOO_TARGET_FINALIZE_HOOKS one which was actually matching my
use-case.

Though it is documented in a subsection a few lines below, let's also
have it in the list of supported hooks so it's not hidden away.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit dd66a2f0b144f7b82f9dc4f820eaec2a5ad02c9c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-hooks.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
index 0ce79f8907..741b71ca29 100644
--- a/docs/manual/adding-packages-hooks.txt
+++ b/docs/manual/adding-packages-hooks.txt
@@ -46,6 +46,8 @@ The following hook points are available:
 * +LIBFOO_PRE_LEGAL_INFO_HOOKS+
 * +LIBFOO_POST_LEGAL_INFO_HOOKS+
 
+* +LIBFOO_TARGET_FINALIZE_HOOKS+
+
 These variables are 'lists' of variable names containing actions to be
 performed at this hook point. This allows several hooks to be
 registered at a given hook point. Here is an example:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
