Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42B6C6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 21:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59E1981584;
	Mon, 13 Mar 2023 21:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59E1981584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEP_uCzXZQz4; Mon, 13 Mar 2023 21:53:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BCD4813F8;
	Mon, 13 Mar 2023 21:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BCD4813F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A41B1BF282
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63DEB400D0
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 21:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63DEB400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sCtXYwRIoz4j for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 21:52:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77FB0402D0
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 21:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77FB0402D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61BEB870AA; Mon, 13 Mar 2023 21:52:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 19:51:41 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 85417fe3ad39e96ae49f6bc0bf25da7d459b4f8f
X-Git-Newrev: d464408908b534615ae3f1a867bc1a5288c174c1
X-Patchwork-Hint: ignore
Message-Id: <20230313215255.61BEB870AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/lttng-babeltrace:
 fix popt static build with libiconv
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

commit: https://git.buildroot.net/buildroot/commit/?id=d464408908b534615ae3f1a867bc1a5288c174c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix the following popt static build failure with libiconv:

configure:18149: checking for poptGetContext in -lpopt
configure:18172: /home/buildroot/autobuild/instance-2/output-1/host/bin/m68k-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static  -I/home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/include/uuid  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lpopt  -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/lib -luuid    >&5
/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/10.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpopt.a(poptint.o): in function `POPT_fprintf':
poptint.c:(.text+0x28a): undefined reference to `libiconv_open'

[...]

checking for poptGetContext in -lpopt... no
configure: error: Cannot find popt.

Fixes:
 - http://autobuild.buildroot.org/results/4f465fe15664b1f9df3f26c331dc550852972f2f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 34625d54c9ba4f9e19fdc350fcf0a48a05c98576)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-configure.ac-fix-popt-static-build.patch  | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/lttng-babeltrace/0002-configure.ac-fix-popt-static-build.patch b/package/lttng-babeltrace/0002-configure.ac-fix-popt-static-build.patch
new file mode 100644
index 0000000000..896c67470f
--- /dev/null
+++ b/package/lttng-babeltrace/0002-configure.ac-fix-popt-static-build.patch
@@ -0,0 +1,48 @@
+From 35076fd4592ca23136ff5eacdf8eaebc926e0224 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 23 Feb 2023 13:04:08 +0100
+Subject: [PATCH] configure.ac: fix popt static build
+
+Fix the following popt static build failure:
+
+configure:18149: checking for poptGetContext in -lpopt
+configure:18172: /home/buildroot/autobuild/instance-2/output-1/host/bin/m68k-buildroot-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static  -I/home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/include/uuid  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lpopt  -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/lib -luuid    >&5
+/home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/10.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpopt.a(poptint.o): in function `POPT_fprintf':
+poptint.c:(.text+0x28a): undefined reference to `libiconv_open'
+
+[...]
+
+checking for poptGetContext in -lpopt... no
+configure: error: Cannot find popt.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4f465fe15664b1f9df3f26c331dc550852972f2f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not upstreamable as popt has been removed with
+https://github.com/efficios/babeltrace/commit/916d0d910ad5407bc7826505aa05b277f5739a34]
+---
+ configure.ac | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a17c23c3..8f700d3e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -223,8 +223,11 @@ AC_CHECK_LIB([c], [faccessat],
+ ]
+ )
+ 
+-AC_CHECK_LIB([popt], [poptGetContext], [],
+-        [AC_MSG_ERROR([Cannot find popt.])]
++PKG_CHECK_MODULES([POPT], [popt], [LIBS="${POPT_LIBS} ${LIBS}"],
++[
++	AC_CHECK_LIB([popt], [poptGetContext], [],
++		[AC_MSG_ERROR([Cannot find popt.])])
++]
+ )
+ 
+ # For Python
+-- 
+2.39.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
