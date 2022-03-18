Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB8DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 08:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F314418A1;
	Fri, 18 Mar 2022 08:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IVvUutCZOA4T; Fri, 18 Mar 2022 08:52:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26099418E1;
	Fri, 18 Mar 2022 08:52:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 231ED1BF215
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 121F141879
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:52:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KIPRj1opEvMR for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 08:52:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 045634170D
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 08:52:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7AAAC844A3; Fri, 18 Mar 2022 08:43:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 09:51:56 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 9eb41375c2fcb7b56cce1b186b72c3eb4fd33833
X-Git-Newrev: 079e1510bbe534d3ef75cfe7e4f5b01c0f5af166
X-Patchwork-Hint: ignore
Message-Id: <20220318084334.7AAAC844A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/iwd: bump version
 to 1.24
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
Content-Type: multipart/mixed; boundary="===============1666180596328780083=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1666180596328780083==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=079e1510bbe534d3ef75cfe7e4f5b01c0f5af166
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- remove 001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch
  (upstream applied [1])

- Changelog (since 1.21, from [2]):

  ver 1.24:
    Fix issue with handshake and missing rekeying support.
    Fix issue with BSS ranking and zero signal strength.
    Fix issue with setting OWE IE length correctly.

  ver 1.23:
    Fix issue with handling handshake offloading.
    Fix issue with at_console and D-Bus policy.

  ver 1.22:
    Fix issue with handling periodic scanning.
    Fix issue with handling scanning completion.
    Fix issue with handling scanning for OWE auto-connect.
    Add support for additional DPP features.

[1] https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=6ce41f621154eff0145dab41308bc145c0440f16
[2] https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 92e0fe71de85d0d7647aefbcab843e66f9bcca99)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...licit-declaration-of-function-explicit_bz.patch | 41 ----------------------
 package/iwd/iwd.hash                               |  2 +-
 package/iwd/iwd.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)

diff --git a/package/iwd/0001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch b/package/iwd/0001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch
deleted file mode 100644
index 3e808deb88..0000000000
--- a/package/iwd/0001-dpp-fix-implicit-declaration-of-function-explicit_bz.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6ce41f621154eff0145dab41308bc145c0440f16 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Mon, 10 Jan 2022 22:32:18 +0100
-Subject: [PATCH] dpp: fix implicit declaration of function explicit_bzero
- warning
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-- add missing src/missing.h include for explicit_bzero, fixes uclibc
-  compile/linking
-
-Fixes:
-
-  src/dpp.c:166:2: warning: implicit declaration of function ‘explicit_bzero’ [-Wimplicit-function-declaration]
-    166 |  explicit_bzero(dpp->r_nonce, dpp->nonce_len);
-        |  ^~~~~~~~~~~~~~
-
-[backport from upstream]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-[yann.morin.1998@free.fr: actual backport now upstreamn applied]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- src/dpp.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/dpp.c b/src/dpp.c
-index 84e89f6c..8091ded1 100644
---- a/src/dpp.c
-+++ b/src/dpp.c
-@@ -30,6 +30,7 @@
- 
- #include "linux/nl80211.h"
- 
-+#include "src/missing.h"
- #include "src/dbus.h"
- #include "src/netdev.h"
- #include "src/module.h"
--- 
-2.34.1
-
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 8e34d2983f..1a58ec88e8 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  bac891df91c605271e91b73cf0015e1ba86ff784347e53fc67601366859b3851  iwd-1.21.tar.xz
+sha256  61b5e48380cd3a6d0529f725eb6974157f1410af165f5d266b87add0bf395224  iwd-1.24.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index a70da86ecc..548b508edb 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.21
+IWD_VERSION = 1.24
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+

--===============1666180596328780083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1666180596328780083==--
