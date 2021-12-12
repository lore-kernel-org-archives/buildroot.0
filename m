Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B11C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39F4E60A94;
	Sun, 12 Dec 2021 14:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54_yjZtnDg_R; Sun, 12 Dec 2021 14:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8792A60A8D;
	Sun, 12 Dec 2021 14:21:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B62D1BF973
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA87885A25
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mhjhUYGUVVqv for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:20:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8BBD85A26
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:20:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EF9DB82DFD; Sun, 12 Dec 2021 14:15:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 11:50:30 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8e52d096dd310840c0d4cc72fbf98aedd51b3c80
X-Git-Newrev: 8348f36e943f860a4378b8e2a30bc8a772aa2ace
X-Patchwork-Hint: ignore
Message-Id: <20211212141521.EF9DB82DFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/samba4: drop
 third patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=8348f36e943f860a4378b8e2a30bc8a772aa2ace
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Drop third patch as it is not needed when using compile_et from heimdal
instead of compile_et from e2fprogs as spotted by upstream in:
https://bugzilla.samba.org/show_bug.cgi?id=13856#c20

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5847208213952c5d2e1ce44d2db19ead9706d5d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/0003-Fix-unistd.h-include.patch     | 38 ----------------------
 ...e_test.c-include-stdint.h-before-cmoka.h.patch} |  0
 ...uild.patch => 0004-dcesrv_core-fix-build.patch} |  0
 3 files changed, 38 deletions(-)

diff --git a/package/samba4/0003-Fix-unistd.h-include.patch b/package/samba4/0003-Fix-unistd.h-include.patch
deleted file mode 100644
index f01b899a18..0000000000
--- a/package/samba4/0003-Fix-unistd.h-include.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 85c33f89df8607ace0707e1360ff0f79f3e8f5f3 Mon Sep 17 00:00:00 2001
-From: Andy Walsh <andy.walsh44+github@gmail.com>
-Date: Wed, 6 Nov 2019 19:28:30 +0100
-Subject: [PATCH] Fix unistd.h include
-
-Fixes build error
-
-source4/heimdal/lib/asn1/asn1_err.c:47:23: error: 'link' redeclared as different kind of symbol
- static struct et_list link = { 0, 0 };
-
-Downloaded from
-https://github.com/Andy2244/openwrt-extra/blob/samba-4.10/samba4/patches/006-samba-4-10-musl_rm_unistd_incl.patch
-
-Upstream bug report: https://bugzilla.samba.org/show_bug.cgi?id=13856
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- lib/replace/replace.h | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/lib/replace/replace.h b/lib/replace/replace.h
-index 1658465866e..e6768c4ae51 100644
---- a/lib/replace/replace.h
-+++ b/lib/replace/replace.h
-@@ -168,10 +168,6 @@
- #include <bsd/unistd.h>
- #endif
- 
--#ifdef HAVE_UNISTD_H
--#include <unistd.h>
--#endif
--
- #ifdef HAVE_STRING_H
- #include <string.h>
- #endif
--- 
-2.20.1
-
diff --git a/package/samba4/0004-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch b/package/samba4/0003-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
similarity index 100%
rename from package/samba4/0004-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
rename to package/samba4/0003-ldap_message_test.c-include-stdint.h-before-cmoka.h.patch
diff --git a/package/samba4/0005-dcesrv_core-fix-build.patch b/package/samba4/0004-dcesrv_core-fix-build.patch
similarity index 100%
rename from package/samba4/0005-dcesrv_core-fix-build.patch
rename to package/samba4/0004-dcesrv_core-fix-build.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
