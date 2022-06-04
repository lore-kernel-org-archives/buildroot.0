Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A49FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 09:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C1E861102;
	Sat,  4 Jun 2022 09:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18Rl7rbm-e9i; Sat,  4 Jun 2022 09:31:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24A5E60E72;
	Sat,  4 Jun 2022 09:31:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F6281BF27A
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 09:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E86184440
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 09:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4eHzzPQqjRl for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 09:31:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9850484367
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 09:31:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 50C9E8633D; Sat,  4 Jun 2022 09:19:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Jun 2022 11:30:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baa55a4e26e6cdee062191792121d1ab1ed38278
X-Git-Newrev: dd66a2f0b144f7b82f9dc4f820eaec2a5ad02c9c
X-Patchwork-Hint: ignore
Message-Id: <20220604091937.50C9E8633D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] manual: add _TARGET_FINALIZE_HOOKS in the
 list of hooks
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd66a2f0b144f7b82f9dc4f820eaec2a5ad02c9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While reading the docs to find hooks, I completely missed the
LIBFOO_TARGET_FINALIZE_HOOKS one which was actually matching my
use-case.

Though it is documented in a subsection a few lines below, let's also
have it in the list of supported hooks so it's not hidden away.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
