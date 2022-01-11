Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ED9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4569E408FE;
	Tue, 11 Jan 2022 20:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id htuq_CMl8RzO; Tue, 11 Jan 2022 20:56:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 408C640900;
	Tue, 11 Jan 2022 20:56:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6DF11BF239
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A192283E62
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RUDZc14TZnqw for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:56:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D63C83E65
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:56:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A3BE5832DB; Tue, 11 Jan 2022 20:49:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 21:55:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84781152c98ceff1c6872d1b87cf59f2fca45af8
X-Git-Newrev: 0a3bdbb88094a7ffc2edc5d94cb2f7af8be360b7
X-Patchwork-Hint: ignore
Message-Id: <20220111204945.A3BE5832DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: bump version to 1.21
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
Content-Type: multipart/mixed; boundary="===============1539427276679295120=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1539427276679295120==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0a3bdbb88094a7ffc2edc5d94cb2f7af8be360b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add 0001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch

- Changelog (since 1.20, from [1]):

  ver 1.21:
  Fix issue with handling disconnect events issued by AP.
  Add experimental support for DPP feature.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...licit-declaration-of-function-explicit_bz.patch | 41 ++++++++++++++++++++++
 package/iwd/iwd.hash                               |  2 +-
 package/iwd/iwd.mk                                 |  2 +-
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/package/iwd/0001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch b/package/iwd/0001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch
new file mode 100644
index 0000000000..6b9cfb3e70
--- /dev/null
+++ b/package/iwd/0001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch
@@ -0,0 +1,41 @@
+From 6ce41f621154eff0145dab41308bc145c0440f16 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 10 Jan 2022 22:32:18 +0100
+Subject: [PATCH 1/1] dpp: fix implicit declaration of function explicit_bzero
+ warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+- add missing src/missing.h include for explicit_bzero, fixes uclibc
+  compile/linking
+
+Fixes:
+
+  src/dpp.c:166:2: warning: implicit declaration of function ‘explicit_bzero’ [-Wimplicit-function-declaration]
+    166 |  explicit_bzero(dpp->r_nonce, dpp->nonce_len);
+        |  ^~~~~~~~~~~~~~
+
+[backport from upstream]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[yann.morin.1998@free.fr: actual backport now upstreamn applied]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ src/dpp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/dpp.c b/src/dpp.c
+index 84e89f6c..8091ded1 100644
+--- a/src/dpp.c
++++ b/src/dpp.c
+@@ -30,6 +30,7 @@
+ 
+ #include "linux/nl80211.h"
+ 
++#include "src/missing.h"
+ #include "src/dbus.h"
+ #include "src/netdev.h"
+ #include "src/module.h"
+-- 
+2.34.1
+
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 58224170e6..8e34d2983f 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  7d51e2ccabe7c500e44061ac725dbd4f6b0fb518b5e3de1681063d0f15d3050f  iwd-1.20.tar.xz
+sha256  bac891df91c605271e91b73cf0015e1ba86ff784347e53fc67601366859b3851  iwd-1.21.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 42f176b05b..a70da86ecc 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.20
+IWD_VERSION = 1.21
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+

--===============1539427276679295120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1539427276679295120==--
