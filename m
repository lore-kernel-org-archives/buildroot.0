Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A56FEB64D8
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 14:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAC0D6137D;
	Wed, 14 Jun 2023 14:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAC0D6137D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FWr2Nck_22np; Wed, 14 Jun 2023 14:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF32161375;
	Wed, 14 Jun 2023 14:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF32161375
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE5521BF966
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87EF0417D6
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87EF0417D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2jjw44LaB-Vr for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 14:54:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B26DA41795
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 14:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B26DA41795
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FB99836FC; Wed, 14 Jun 2023 14:54:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jun 2023 16:51:46 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5fab4b32bbdaec13c94daaf53591e6190cce4851
X-Git-Newrev: 17289b98e1f72b3ed148f60472edbd8e0f63d4ec
X-Patchwork-Hint: ignore
Message-Id: <20230614145426.9FB99836FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libdeflate: force
 arm mode instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=17289b98e1f72b3ed148f60472edbd8e0f63d4ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following build failure:

/tmp/ccGKQdKj.s: Assembler messages:
/tmp/ccGKQdKj.s:199: Error: invalid constant (7) after fixup
/tmp/ccGKQdKj.s:327: Error: invalid constant (0) after fixup
/tmp/ccGKQdKj.s:338: Error: invalid constant (1) after fixup
/tmp/ccGKQdKj.s:345: Error: invalid constant (20) after fixup
/tmp/ccGKQdKj.s:354: Error: invalid constant (20) after fixup
/tmp/ccGKQdKj.s:372: Error: invalid constant (20) after fixup
/tmp/ccGKQdKj.s:528: Error: invalid constant (3f) after fixup
/tmp/ccGKQdKj.s:531: Error: invalid constant (3f) after fixup
/tmp/ccGKQdKj.s:202: Error: invalid constant (20000) after fixup
/tmp/ccGKQdKj.s:482: Error: invalid constant (20000) after fixup
/tmp/ccGKQdKj.s:549: Error: invalid constant (20000) after fixup

Fixes:
http://autobuild.buildroot.net/results/0103d64a4a6a9b0a708bfb77bf1714edc7acc714/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 62200879d49c085b120f37ce31d9123ebcc5895a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdeflate/libdeflate.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 67e97c6e5e..c09a033325 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -9,8 +9,17 @@ LIBDEFLATE_SITE = $(call github,ebiggers,libdeflate,v$(LIBDEFLATE_VERSION))
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
 LIBDEFLATE_INSTALL_STAGING = YES
+
+LIBDEFLATE_CFLAGS = -D_DEFAULT_SOURCE
+
+# Thumb build is broken, build in ARM mode, since all architectures
+# that support Thumb1 also support ARM.
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+LIBDEFLATE_CFLAGS += -marm
+endif
+
 LIBDEFLATE_CONF_OPTS = \
-	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -D_DEFAULT_SOURCE"
+	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(LIBDEFLATE_CFLAGS)"
 
 ifeq ($(BR2_SHARED_LIBS),y)
 LIBDEFLATE_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
