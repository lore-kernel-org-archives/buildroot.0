Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0044AC77B7E
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 07:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1C264144E;
	Tue,  2 May 2023 07:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1C264144E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6G1JU398iZ-E; Tue,  2 May 2023 07:30:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAD8241789;
	Tue,  2 May 2023 07:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAD8241789
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADDD91BF400
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5028080EA8
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 07:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5028080EA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n1hShwVhg3ze for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 07:28:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75BFF80EB5
 for <buildroot@buildroot.org>; Tue,  2 May 2023 07:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75BFF80EB5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6591285697; Tue,  2 May 2023 07:28:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 2 May 2023 08:47:33 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5c2a942eb06ffed94f56c5cd6f11dd92c67bdcc7
X-Git-Newrev: e5e171093f195227012e76821933d5052ae04e2c
X-Patchwork-Hint: ignore
Message-Id: <20230502072850.6591285697@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/readline: add
 upstream patch to fix crash with invalid locale specification
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5e171093f195227012e76821933d5052ae04e2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Add upstream patch to fix crash with invalid locale specification (see [1]
for details).

Fixes:

  - https://bugs.busybox.net/show_bug.cgi?id=15456

[1] https://lists.gnu.org/archive/html/bug-readline/2022-10/msg00002.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2dff6e93ca2a675cebe5cfb6d864ff5da78a4ef4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...2-patch-1-fix-crash-when-readline-is-star.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
new file mode 100644
index 0000000000..b0f784b8ba
--- /dev/null
+++ b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
@@ -0,0 +1,41 @@
+From b8d91eab12603fa88e095248855f5f772d182d05 Mon Sep 17 00:00:00 2001
+From: Chet Ramey <chet.ramey@case.edu>
+Date: Wed, 5 Oct 2022 10:41:16 -0400
+Subject: [PATCH] Readline-8.2 patch 1: fix crash when readline is started with
+ an invalid locale specification
+
+[Upstream: https://git.savannah.gnu.org/cgit/readline.git/patch/?id=7274faabe97ce53d6b464272d7e6ab6c1392837b
+ Stripped unrelated ._.gitignore change]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ nls.c      | 4 ++++
+ patchlevel | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/nls.c b/nls.c
+index 5c6a13b..8c027d6 100644
+--- a/nls.c
++++ b/nls.c
+@@ -141,6 +141,10 @@ _rl_init_locale (void)
+   if (lspec == 0)
+     lspec = "";
+   ret = setlocale (LC_CTYPE, lspec);	/* ok, since it does not change locale */
++  if (ret == 0 || *ret == 0)
++    ret = setlocale (LC_CTYPE, (char *)NULL);
++  if (ret == 0 || *ret == 0)
++    ret = RL_DEFAULT_LOCALE;
+ #else
+   ret = (lspec == 0 || *lspec == 0) ? RL_DEFAULT_LOCALE : lspec;
+ #endif
+diff --git a/patchlevel b/patchlevel
+index d8c9df7..fdf4740 100644
+--- a/patchlevel
++++ b/patchlevel
+@@ -1,3 +1,3 @@
+ # Do not edit -- exists only for use by patch
+ 
+-0
++1
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
