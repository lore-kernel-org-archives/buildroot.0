Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECADEC83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 22:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEC9760DE8;
	Mon, 28 Jul 2025 22:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mw4huBvMolVE; Mon, 28 Jul 2025 22:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCA3760DD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCA3760DD9;
	Mon, 28 Jul 2025 22:27:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3EFE432
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D646660DDA
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DgC006Jb6il for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 22:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EED660DD9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EED660DD9
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 22:27:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C11586B7B; Mon, 28 Jul 2025 22:27:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Jul 2025 00:24:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44801fa77d8368c88c452954f3ae2d4a616651aa
X-Git-Newrev: 5b5889ee5f57e6159f44d18b13c44083772595e8
X-Patchwork-Hint: ignore
Message-Id: <20250728222713.1C11586B7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlrpc: fix boolean definitions
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6063115506967628273=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6063115506967628273==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5b5889ee5f57e6159f44d18b13c44083772595e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't define boolean macros for C23 standard as they are implemented
as keywords.

Fixes the following error:

make[2]: Entering directory
'/home/user/Documents/versioned/oss/xmlrpc-c/lib/util'
gcc -c -DNDEBUG -pthread -Wall -W -Wno-uninitialized -Wundef
-Wno-unknown-pragmas -Wmissing-declarations -Wstrict-prototypes
-Wmissing-prototypes -Wimplicit -fno-common -g -O3
-Isrcdir/lib/util/include
-I/home/user/Documents/versioned/oss/xmlrpc-c   casprintf.c
In file included from casprintf.c:9:
srcdir/lib/util/include/bool.h:13:5: error: cannot use keyword ‘false’
as enumeration constant
   13 |     false = 0,
      |     ^~~~~
srcdir/lib/util/include/bool.h:13:5: note: ‘false’ is a keyword with
‘-std=c23’ onwards
srcdir/lib/util/include/bool.h:15:3: error: expected ‘;’, identifier
or ‘(’ before ‘bool’
   15 | } bool;
      |   ^~~~
srcdir/lib/util/include/bool.h:15:3: warning: useless type name in
empty declaration

Upstream: https://sourceforge.net/p/xmlrpc-c/code/3318/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../libxmlrpc/0001-Fix-boolean-definitions.patch   | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/libxmlrpc/0001-Fix-boolean-definitions.patch b/package/libxmlrpc/0001-Fix-boolean-definitions.patch
new file mode 100644
index 0000000000..0fdfdf7f03
--- /dev/null
+++ b/package/libxmlrpc/0001-Fix-boolean-definitions.patch
@@ -0,0 +1,25 @@
+Index: lib/util/include/bool.h
+===================================================================
+Don't define boolean macros for C23 standard as they are implemented
+as keywords.
+
+Upstream: https://sourceforge.net/p/xmlrpc-c/code/3318/
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+
+diff --git a/lib/util/include/bool.h b/lib/util/include/bool.h
+--- a/lib/util/include/bool.h	(revision 3316)
++++ b/lib/util/include/bool.h	(working copy)
+@@ -5,7 +5,11 @@
+    collision.
+ */
+ 
+-#ifndef __cplusplus
++#ifdef __cplusplus
++/* bool has always been part of the C++ language */
++#elif __STDC_VERSION__ >= 202311L
++/* bool is part of the C23 standard */
++#else
+ /* At least the GNU compiler defines __bool_true_false_are_defined */
+ #ifndef __bool_true_false_are_defined
+ #define __bool_true_false_are_defined

--===============6063115506967628273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6063115506967628273==--
