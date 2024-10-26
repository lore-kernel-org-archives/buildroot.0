Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D6BD10BFA
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78C58605F7;
	Sat, 26 Oct 2024 14:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7JrPT8y-3aH; Sat, 26 Oct 2024 14:08:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ED3C6063D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ED3C6063D;
	Sat, 26 Oct 2024 14:08:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D0195C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D4C3400D7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCS2_tP3NQyH for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55FE5401DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55FE5401DD
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:08:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C4CD83BD1; Sat, 26 Oct 2024 14:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:08:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 408bb87fbbea6f4f7903b229ec0116b73527096e
X-Git-Newrev: a06fd96543b98b27ea437f9a0afa88e7a6525f23
X-Patchwork-Hint: ignore
Message-Id: <20241026140830.4C4CD83BD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/babeld: bump to version 1.13.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a06fd96543b98b27ea437f9a0afa88e7a6525f23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Implemented the per-interface option "probe-mtu", which automatically
  discards links with a mis-configured MTU.
- Fixed a typo in the handing of the option "v4viav6".

Release notes:
https://github.com/jech/babeld/blob/master/CHANGES

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/babeld/0001-Fix-uclibc-build-issue.patch | 38 ++++++++++++++++++++++++
 package/babeld/babeld.hash                       |  2 +-
 package/babeld/babeld.mk                         |  2 +-
 3 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/package/babeld/0001-Fix-uclibc-build-issue.patch b/package/babeld/0001-Fix-uclibc-build-issue.patch
new file mode 100644
index 0000000000..fb2f69e98b
--- /dev/null
+++ b/package/babeld/0001-Fix-uclibc-build-issue.patch
@@ -0,0 +1,38 @@
+From f8e5fbb33690b516b8516590def5136e6619de4c Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Tue, 17 Sep 2024 21:48:01 +0200
+Subject: [PATCH] Fix uclibc build issue
+
+This patch fixes the following compilation error raised by the bump to
+version 1.13.1 in Buildroot [1] using uclibc as the C library for the
+cross-compilation toolchain:
+
+net.c: In function 'babel_send':
+net.c:199:27: error: 'IPV6_DONTFRAG' undeclared (first use in this function)
+  199 |         cmsg->cmsg_type = IPV6_DONTFRAG;;
+
+[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240917201030.11583-1-dario.binacchi@amarulasolutions.com/
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/jech/babeld/pull/121
+---
+ net.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/net.c b/net.c
+index 7a7b57844e6c..30de3dafe1d9 100644
+--- a/net.c
++++ b/net.c
+@@ -37,6 +37,10 @@ THE SOFTWARE.
+ #include <arpa/inet.h>
+ #include <errno.h>
+ 
++#if defined(__UCLIBC__)
++#include <linux/in6.h>
++#endif
++
+ #include "babeld.h"
+ #include "util.h"
+ #include "net.h"
+-- 
+2.43.0
+
diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index 3eb5d22081..ab2ffc6ef8 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d085ccccfb06a11d7fa5b54c51d9c410f5f3b0a9389f584951336ff178f293b8  babeld-1.13.tar.gz
+sha256  15f24d26da0ccfc073abcdef0309f281e4684f2aa71126f826572c4c845e8dd9  babeld-1.13.1.tar.gz
 sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index 67ff553b8b..e9d20111f9 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BABELD_VERSION = 1.13
+BABELD_VERSION = 1.13.1
 BABELD_SITE = https://www.irif.fr/~jch/software/files
 BABELD_LICENSE = MIT
 BABELD_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
