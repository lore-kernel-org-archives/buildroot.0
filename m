Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729A6C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 08:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AA0E402EE;
	Fri,  1 Mar 2024 08:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2a0RzWmFxJfI; Fri,  1 Mar 2024 08:26:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4219240513
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4219240513;
	Fri,  1 Mar 2024 08:26:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C0D31BF377
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6732560770
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WRiLPdfwDGni for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 08:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A35F1607B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A35F1607B3
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 08:26:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 886DB87E4F; Fri,  1 Mar 2024 08:26:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 09:25:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ee61ef95b0e9e66d2d251049ddba3696e51f5a6
X-Git-Newrev: 64dbf7ff6a19acec1fa3a31853291ecd739a45b3
X-Patchwork-Hint: ignore
Message-Id: <20240301082602.886DB87E4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpthsem: fix build with autoconf
 >= 2.72
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

commit: https://git.buildroot.net/buildroot/commit/?id=64dbf7ff6a19acec1fa3a31853291ecd739a45b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move fi statement where it belongs to fix the following build failure
raised since bump of autoconf to version 2.72 in commit
524f3536029dace3ce9aa154d3ca4685582e1955:

checking for stack setup via makecontext... ./configure: line 15863: syntax error near unexpected token `;;'

Fixes: 524f3536029dace3ce9aa154d3ca4685582e1955
 - http://autobuild.buildroot.org/results/013e0d3f72582ce3675f65786c014518682d703b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...acinclude.m4-fix-build-with-autoconf-2.72.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/libpthsem/0002-acinclude.m4-fix-build-with-autoconf-2.72.patch b/package/libpthsem/0002-acinclude.m4-fix-build-with-autoconf-2.72.patch
new file mode 100644
index 0000000000..0c66482c3a
--- /dev/null
+++ b/package/libpthsem/0002-acinclude.m4-fix-build-with-autoconf-2.72.patch
@@ -0,0 +1,36 @@
+From 3ec1a1c22142c547bc7f44622291bf0abdc322f1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 25 Feb 2024 14:33:02 +0100
+Subject: [PATCH] acinclude.m4: fix build with autoconf >= 2.72
+
+Move fi statement where it belongs to fix the following build failure
+with autoconf >= 2.72:
+
+checking for stack setup via makecontext... ./configure: line 15863: syntax error near unexpected token `;;'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/013e0d3f72582ce3675f65786c014518682d703b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/linknx/pthsem/pull/1
+---
+ acinclude.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 03b42de..d74889f 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -1426,8 +1426,8 @@ ac_cv_stacksetup_$1='guessed:(skaddr),(sksize)'
+ ])
+ dnl #   restore original compile environment
+ CFLAGS="$OCFLAGS"
+-])dnl
+ fi
++])dnl
+ dnl #   extract result ingredients of single cached result value
+ type=`echo $ac_cv_stacksetup_$1 | sed -e 's;:.*$;;'`
+ addr=`echo $ac_cv_stacksetup_$1 | sed -e 's;^.*:;;' -e 's;,.*$;;'`
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
