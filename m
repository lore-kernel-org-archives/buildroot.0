Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B521BC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26FCC4087F;
	Tue, 13 Sep 2022 20:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26FCC4087F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lYrzHistwZ4T; Tue, 13 Sep 2022 20:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4DCC40650;
	Tue, 13 Sep 2022 20:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4DCC40650
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 829641BF27E
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 20:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DD6881351
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 20:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DD6881351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5DfopObTvFn for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 20:59:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10E2A812E4
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10E2A812E4
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 20:59:08 +0000 (UTC)
Received: from localhost.localdomain ([146.241.22.4])
 by Aruba Outgoing Smtp  with ESMTPSA
 id YCzpoWQDhUncTYCzqoELP2; Tue, 13 Sep 2022 22:59:06 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 22:59:05 +0200
Message-Id: <20220913205905.185292-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHLzjSrVkq14BVj0qfsY+9wZfTBTQr7iVsTRFKfN3DB7GLPp0/1q5T1icxghOt0071663QKgoPe0Rts8Lhc20eKqOqL1n5KqhLxlLasbalejcuWQbg4F
 H2zjHdklBQwEI6UtaSKH293A8LTULmaF2b5K8sAbT/BpQ+0aDOnbzlJYeJ1K7vxXjweNiD+supR7quDXbTn4/oUEII7CI7YPu30bjY3cKjG/PNLRgcJuRlFn
 Xv/9Te5NFGp4LnRFZlOxBx4TpUB15ZwQONFQ07Sasjs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663102746; bh=Ytcw0dKq3B8TlseFBv51cU4dqOasWgFbnKoo77C0LdA=;
 h=From:To:Subject:Date:MIME-Version;
 b=FB60SqAWk0u7hQk0Okd7ykzmLqLe0uK6iNps73qpd28+kk8MPWQIgjybTEfLxJMT1
 /4w4n+Sy8HFlrzDLUtAsC+ph5nEIrLJXN2TIK9SGj4simreQ4+matcDkjr/J8UwOe1
 STU/17Ydb7tGPGgvrpVQ7yBCdRV3LxD+F0tJ7Yd2mx/1aOq5eb3ze7YV4oIutTnSx3
 Pt+RBYzEokRXEptKungmUQfGEvjfAZdf8OrxYZphzZRL6/tqulQNP2NfRMJe3WTp0G
 orrsHI1EgmOJgw7yKj0Whz9AsLgZXQeCErC/a+Uaw7+zZoOVxkTcYeBrof6WwbJ8vm
 MJ9ywW4D7RrHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=FB60SqAW
Subject: [Buildroot] [PATCH] package/libnspr: bump to version 4.35
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's drop local patch that has been upstreamed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...-1765100-fix-build-on-mips-musl-libc.patch | 33 -------------------
 package/libnspr/libnspr.hash                  |  4 +--
 package/libnspr/libnspr.mk                    |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch

diff --git a/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch b/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch
deleted file mode 100644
index 10bf74130c..0000000000
--- a/package/libnspr/0001-Bug-1765100-fix-build-on-mips-musl-libc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 00e5b818f2d9f3264107801fc2fcff33a9355a78 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Sun, 17 Apr 2022 23:55:26 +0200
-Subject: [PATCH] Bug 1765100 - fix build on mips+musl libc
-
-This patch fix build failure on mips with musl libc by using Linux
-<asm/sgidefs.h> instead of the one provided by libc since musl doesn't
-provide <sgidefs.h>.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
-This patch is pending upstream:
-https://bugzilla.mozilla.org/show_bug.cgi?id=1765100
----
- nspr/pr/include/md/_linux.cfg | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nspr/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
-index 23b160fd..dbc0d40e 100644
---- a/nspr/pr/include/md/_linux.cfg
-+++ b/nspr/pr/include/md/_linux.cfg
-@@ -499,7 +499,7 @@
- #elif defined(__mips__)
- 
- /* For _ABI64 */
--#include <sgidefs.h>
-+#include <asm/sgidefs.h>
- 
- #ifdef __MIPSEB__
- #define IS_BIG_ENDIAN 1
--- 
-2.25.1
-
diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index a368f02c54..c569135663 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.34.1/src/SHA256SUMS
-sha256  c5b8354c48b632b8f4c1970628146c0e0c0ca8f32c7315d7d5736c002e03774f  nspr-4.34.1.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.35/src/SHA256SUMS
+sha256  7ea3297ea5969b5d25a5dd8d47f2443cda88e9ee746301f6e1e1426f8a6abc8f  nspr-4.35.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index fcb2a1db49..e891aa4852 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.34.1
+LIBNSPR_VERSION = 4.35
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
