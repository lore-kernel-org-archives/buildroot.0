Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EF5C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 21:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F26CA418D7;
	Fri, 11 Mar 2022 21:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oq6TP958G95V; Fri, 11 Mar 2022 21:56:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17F7B4184A;
	Fri, 11 Mar 2022 21:56:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1ED071BF38E
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 21:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BEEF404AF
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 21:56:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j3SJ7bDLz8K4 for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 21:56:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3739F4038B
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 21:56:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5175783CAC; Fri, 11 Mar 2022 21:48:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 22:56:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 27503b58aa7d245981be1334111e4cbe98649144
X-Git-Newrev: 7d7b0e8c1ed1e15ef6841c979b75c47695f6b134
X-Patchwork-Hint: ignore
Message-Id: <20220311214814.5175783CAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Makefile: unexport
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d7b0e8c1ed1e15ef6841c979b75c47695f6b134
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
index a3dfc52f51..9dc0a8673c 100644
--- a/Makefile
+++ b/Makefile
@@ -420,6 +420,7 @@ unexport O
 unexport GCC_COLORS
 unexport PLATFORM
 unexport OS
+unexport DEVICE_TREE
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
