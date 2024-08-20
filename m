Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B54C531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 20:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 560DA40B8D;
	Tue, 20 Aug 2024 20:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SiGrJwII4cxx; Tue, 20 Aug 2024 20:07:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBE3240BC2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBE3240BC2;
	Tue, 20 Aug 2024 20:07:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40F231BF376
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BF0860AB7
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 20:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSacY6hviFNK for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 20:07:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F75660B10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F75660B10
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 20:07:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E15686192; Tue, 20 Aug 2024 20:07:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 21:28:51 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 88212cba65eb2943336832d04ad72ac8e281acbb
X-Git-Newrev: 78c27b3fbcdc104e763c2da6f63f63e90a907fe3
X-Patchwork-Hint: ignore
Message-Id: <20240820200712.0E15686192@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/attr: add missing
 libgen.h header
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

commit: https://git.buildroot.net/buildroot/commit/?id=78c27b3fbcdc104e763c2da6f63f63e90a907fe3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Resolves the following error when building against MUSL:

tools/attr.c: In function 'main':
tools/attr.c:69:20: error: implicit declaration of function 'basename'
[-Wimplicit-function-declaration]
   69 |         progname = basename(argv[0]);
      |                    ^~~~~~~~
tools/attr.c:69:18: error: assignment to 'char *' from 'int' makes
pointer from integer without a cast [-Wint-conversion]
   69 |         progname = basename(argv[0]);
      |                  ^

Upstream: https://git.savannah.nongnu.org/cgit/attr.git/commit/?id=8a80d895dfd779373363c3a4b62ecce5a549efb2

Fixes: http://autobuild.buildroot.net/results/c61206968eda9913e37e95a61dc3e10399503fcd/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Romain: use upstream patch]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit fa241685e7f92311f5fd50ce17c1541748fe285b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-Add-missing-libgen.h-include-for-basena.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/attr/0003-tools-attr.c-Add-missing-libgen.h-include-for-basena.patch b/package/attr/0003-tools-attr.c-Add-missing-libgen.h-include-for-basena.patch
new file mode 100644
index 0000000000..304177257c
--- /dev/null
+++ b/package/attr/0003-tools-attr.c-Add-missing-libgen.h-include-for-basena.patch
@@ -0,0 +1,32 @@
+From 8a80d895dfd779373363c3a4b62ecce5a549efb2 Mon Sep 17 00:00:00 2001
+From: "Haelwenn (lanodan) Monnier" <contact@hacktivis.me>
+Date: Sat, 30 Mar 2024 10:17:10 +0100
+Subject: [PATCH] tools/attr.c: Add missing libgen.h include for basename(3)
+
+Fixes compilation issue with musl and modern C99 compilers.
+
+See: https://bugs.gentoo.org/926294
+
+Upstream: https://git.savannah.nongnu.org/cgit/attr.git/commit/?id=8a80d895dfd779373363c3a4b62ecce5a549efb2
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ tools/attr.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/attr.c b/tools/attr.c
+index f12e4af..6a3c1e9 100644
+--- a/tools/attr.c
++++ b/tools/attr.c
+@@ -28,6 +28,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <locale.h>
++#include <libgen.h>
+ 
+ #include <attr/attributes.h>
+ 
+-- 
+2.45.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
