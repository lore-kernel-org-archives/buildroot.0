Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9809DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 15:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A8FA401A4;
	Sun, 13 Mar 2022 15:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gyP-z3H8Zot; Sun, 13 Mar 2022 15:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE88940187;
	Sun, 13 Mar 2022 15:39:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0F351BF392
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 15:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88E86408C5
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 15:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtNSaHLEHiru for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 15:39:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8DD8408C4
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 15:39:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CB17683CBB; Sun, 13 Mar 2022 15:31:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 22:56:22 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 37683e06b9daa9eff057ede540b844a12d0744f5
X-Git-Newrev: d8cb00a283392b51bb34919e2366ba93762436ae
X-Patchwork-Hint: ignore
Message-Id: <20220313153102.CB17683CBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] Makefile: unexport
 'DEVICE_TREE' environment variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8cb00a283392b51bb34919e2366ba93762436ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

U-Boot looks for the environment variable DEVICE_TREE and uses its value if
set instead of the CONFIG_DEFAULT_DEVICE_TREE configuration option since
v2021.01, more specifically commit c0f1ebe9c1b9745e (binman: Allow selecting
default FIT configuration) - So unexport it like we do for other
"troublesome" environment variables to ensure consistent behaviour.

Reported-by: Neal Frager <nealf@xilinx.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d3910057c6ae38e2cf72e8c86cd84756fffba2ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 49551aacc7..09bf835b05 100644
--- a/Makefile
+++ b/Makefile
@@ -426,6 +426,7 @@ unexport O
 unexport GCC_COLORS
 unexport PLATFORM
 unexport OS
+unexport DEVICE_TREE
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
