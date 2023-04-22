Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E60C77B78
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 21:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CB29408E0;
	Sat, 22 Apr 2023 21:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CB29408E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s4Wsw9zEswfi; Sat, 22 Apr 2023 21:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C875241D93;
	Sat, 22 Apr 2023 21:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C875241D93
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 466FC1C2B82
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 21:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10B2683B09
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 21:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10B2683B09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JlDJUgZeZolM for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 21:10:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F2A483B26
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 21:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F2A483B26
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C49E8411F; Sat, 22 Apr 2023 21:10:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 22 Apr 2023 23:08:32 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 410c9f01ed9709e57f274d93cc0df2b579eaf721
X-Git-Newrev: aa658bec37677fa6b7259e186a80a75231ab5b92
X-Patchwork-Hint: ignore
Message-Id: <20230422211058.6C49E8411F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] utils/check-package: drop
 six usage
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa658bec37677fa6b7259e186a80a75231ab5b92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The shebang in check-package now defines python3. There is no longer a
need to maintain support with python 2.x.

See-also: 02b165dc71 (check-package: fix Python3 support)

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Tested-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b7d4ae98faac020e2f620fda47c2777ad1deddfa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/check-package | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/utils/check-package b/utils/check-package
index 98a25bd0b2..46f2897b51 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -6,7 +6,6 @@ import inspect
 import magic
 import os
 import re
-import six
 import sys
 
 import checkpackagelib.base
@@ -218,12 +217,9 @@ def check_file_using_lib(fname):
         if fail > 0:
             failed.add(name)
         nwarnings += warn
-    if six.PY3:
-        f = open(fname, "r", errors="surrogateescape")
-    else:
-        f = open(fname, "r")
+
     lastline = ""
-    for lineno, text in enumerate(f.readlines()):
+    for lineno, text in enumerate(open(fname, "r", errors="surrogateescape").readlines()):
         nlines += 1
         for name, cf in objects:
             if cf.disable.search(lastline):
@@ -233,7 +229,7 @@ def check_file_using_lib(fname):
                 failed.add(name)
             nwarnings += warn
         lastline = text
-    f.close()
+
     for name, cf in objects:
         warn, fail = print_warnings(cf.after(), name in xfail)
         if fail > 0:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
