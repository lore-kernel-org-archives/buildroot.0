Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D339E77199
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EB9460B9E;
	Wed,  8 Jan 2025 22:04:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_ZnpO-1JGfE; Wed,  8 Jan 2025 22:04:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2060660BA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2060660BA5;
	Wed,  8 Jan 2025 22:04:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E5687AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 615B2402F4
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ml_Af3oUxVf5 for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8596D40300
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8596D40300
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8060483F4D; Wed,  8 Jan 2025 22:04:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 8 Jan 2025 22:17:57 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 1fae268c4e7b783827b883c53aadd5901d7e8356
X-Git-Newrev: fa8d58ebe86205a64d2bf4a5a8e481e8a5627b9c
X-Patchwork-Hint: ignore
Message-Id: <20250108220444.8060483F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/c-icap: backport
 patch fixing missing <stdio.h> include
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fa8d58ebe86205a64d2bf4a5a8e481e8a5627b9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

This commit backports an upstream patch that fixes a missing <stdio.h>
include, causing build failures with toolchains based on GCC 14.x.

Fixes:

  http://autobuild.buildroot.net/results/a9999fd417aa5edcd6302e674a72a99d89675466/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: fix broken autobuild url in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ff3861a344d0832e48bc0daee77f8bcd6518d099)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-warning-about-missing-stdio.h-include-fi.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/c-icap/0002-Fix-compile-warning-about-missing-stdio.h-include-fi.patch b/package/c-icap/0002-Fix-compile-warning-about-missing-stdio.h-include-fi.patch
new file mode 100644
index 0000000000..986ed43355
--- /dev/null
+++ b/package/c-icap/0002-Fix-compile-warning-about-missing-stdio.h-include-fi.patch
@@ -0,0 +1,25 @@
+From ae8a1bc4979c797bb1f152fc92cfe6bc05a44594 Mon Sep 17 00:00:00 2001
+From: Christos Tsantilas <christos@chtsanti.net>
+Date: Tue, 20 Nov 2018 17:10:16 +0200
+Subject: [PATCH] Fix compile warning about missing stdio.h include file
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/c-icap/c-icap-server/commit/ae8a1bc4979c797bb1f152fc92cfe6bc05a44594
+---
+ tests/test_base64.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/test_base64.c b/tests/test_base64.c
+index 8a4a76c..7692197 100644
+--- a/tests/test_base64.c
++++ b/tests/test_base64.c
+@@ -1,5 +1,6 @@
+ #include "common.h"
+ #include "simple_api.h"
++#include <stdio.h>
+ 
+ 
+ int main(int argc, char *argv[])
+-- 
+2.47.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
