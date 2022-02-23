Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099E3C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 14:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E20960F71;
	Wed, 23 Feb 2022 14:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQe_o8vt2yYL; Wed, 23 Feb 2022 14:04:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA61C60F6C;
	Wed, 23 Feb 2022 14:04:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 361BE1BF3DD
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 14:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E7DB60F6C
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 14:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0c1eU1x2IYV for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 14:04:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 549CD60F6B
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 14:04:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 66C7883845; Wed, 23 Feb 2022 13:56:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 15:03:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a0d90d8aba6862060ba6e839ebd75436f671acf
X-Git-Newrev: d3910057c6ae38e2cf72e8c86cd84756fffba2ac
X-Patchwork-Hint: ignore
Message-Id: <20220223135658.66C7883845@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: unexport 'DEVICE_TREE'
 environment variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3910057c6ae38e2cf72e8c86cd84756fffba2ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot looks for the environment variable DEVICE_TREE and uses its value if
set instead of the CONFIG_DEFAULT_DEVICE_TREE configuration option since
v2021.01, more specifically commit c0f1ebe9c1b9745e (binman: Allow selecting
default FIT configuration) - So unexport it like we do for other
"troublesome" environment variables to ensure consistent behaviour.

Reported-by: Neal Frager <nealf@xilinx.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index d92438166f..0ed93e600d 100644
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
