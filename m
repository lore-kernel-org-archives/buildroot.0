Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCCFC77B73
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 07:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00EEA4158B;
	Tue,  2 May 2023 07:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00EEA4158B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WD-Cqwt58D5F; Tue,  2 May 2023 07:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 393E54144E;
	Tue,  2 May 2023 07:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 393E54144E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CE111BF400
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67A6760BC6
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67A6760BC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1RWFhAROubU7 for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 07:28:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D8F760BA8
 for <buildroot@buildroot.org>; Tue,  2 May 2023 07:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D8F760BA8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D9E6856A7; Tue,  2 May 2023 07:28:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 2 May 2023 08:47:42 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e5e171093f195227012e76821933d5052ae04e2c
X-Git-Newrev: 5c3c5a6bbdf7f71f2632f2aeb02e6da79e5641f1
X-Patchwork-Hint: ignore
Message-Id: <20230502072850.6D9E6856A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/readline: fix
 "Upstream:" tag
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c3c5a6bbdf7f71f2632f2aeb02e6da79e5641f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The test chckes that the "Upstream:" tag be on the first column, without
any leading character (no space, no bracket of any kind).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d89fdaea2b795ea0e06c3b7ed092d50950559fa8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
