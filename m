Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E642BC7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 19:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96EEC81E83;
	Mon, 24 Apr 2023 19:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96EEC81E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EX_zxQ39OMVo; Mon, 24 Apr 2023 19:09:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC6E981E78;
	Mon, 24 Apr 2023 19:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC6E981E78
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C68F81BF487
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 19:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A057F81E78
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 19:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A057F81E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d7a_FQ4-Krdy for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 19:09:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3E7E813D6
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 19:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3E7E813D6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0C43844F9; Mon, 24 Apr 2023 19:09:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 21:02:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2dff6e93ca2a675cebe5cfb6d864ff5da78a4ef4
X-Git-Newrev: d89fdaea2b795ea0e06c3b7ed092d50950559fa8
X-Patchwork-Hint: ignore
Message-Id: <20230424190905.B0C43844F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/readline: fix "Upstream:" tag
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

commit: https://git.buildroot.net/buildroot/commit/?id=d89fdaea2b795ea0e06c3b7ed092d50950559fa8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test chckes that the "Upstream:" tag be on the first column, without
any leading character (no space, no bracket of any kind).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
index b0f784b8ba..c2c2d81260 100644
--- a/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
+++ b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
@@ -4,8 +4,8 @@ Date: Wed, 5 Oct 2022 10:41:16 -0400
 Subject: [PATCH] Readline-8.2 patch 1: fix crash when readline is started with
  an invalid locale specification
 
-[Upstream: https://git.savannah.gnu.org/cgit/readline.git/patch/?id=7274faabe97ce53d6b464272d7e6ab6c1392837b
- Stripped unrelated ._.gitignore change]
+Upstream: https://git.savannah.gnu.org/cgit/readline.git/patch/?id=7274faabe97ce53d6b464272d7e6ab6c1392837b
+[peter: stripped unrelated ._.gitignore change]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
  nls.c      | 4 ++++
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
