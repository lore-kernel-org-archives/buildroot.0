Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586A4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 20:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3C5960AFC;
	Sat, 12 Feb 2022 20:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5lcrwRAg0Pz; Sat, 12 Feb 2022 20:40:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38DF960E39;
	Sat, 12 Feb 2022 20:40:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F36391BF577
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E20634032D
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mHUZmC-o6JTl for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 20:39:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24E1740325
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 20:39:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7560E81D55; Sat, 12 Feb 2022 20:32:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 21:39:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37e49ce3e17cc1f434b05a9a431c716bd70dc540
X-Git-Newrev: 6c00a319ac6bd1b1f113abe988f8d62e76984323
X-Patchwork-Hint: ignore
Message-Id: <20220212203220.7560E81D55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: drop
 BR2_PACKAGE_PYTHON_PY_ONLY logic
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c00a319ac6bd1b1f113abe988f8d62e76984323
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option was removed by commit 306839586b (package/python: drop target
package).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 77c7e585f5..3483d55c14 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -365,8 +365,6 @@ def gen_config(args):
         configlines.append("BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y\n")
     if randint(0, 20) == 0:
         configlines.append("BR2_STATIC_LIBS=y\n")
-    if randint(0, 20) == 0:
-        configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
     if randint(0, 20) == 0:
         configlines.append("BR2_PACKAGE_PYTHON3_PY_ONLY=y\n")
     if randint(0, 5) == 0:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
