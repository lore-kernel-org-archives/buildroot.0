Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79CDC77B7A
	for <buildroot@archiver.kernel.org>; Wed,  7 Jun 2023 20:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 382BF81E2A;
	Wed,  7 Jun 2023 20:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 382BF81E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tOYYwCaAynPH; Wed,  7 Jun 2023 20:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C76E817A3;
	Wed,  7 Jun 2023 20:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C76E817A3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 940481BF964
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 20:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E5584054B
 for <buildroot@lists.busybox.net>; Wed,  7 Jun 2023 20:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E5584054B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obUXymzcF7sm for <buildroot@lists.busybox.net>;
 Wed,  7 Jun 2023 20:44:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E735403C4
 for <buildroot@buildroot.org>; Wed,  7 Jun 2023 20:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E735403C4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88C6386D6F; Wed,  7 Jun 2023 20:44:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Jun 2023 22:20:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4fec34ba231b78ea24a6480c31aa45132b40784
X-Git-Newrev: 62200879d49c085b120f37ce31d9123ebcc5895a
X-Patchwork-Hint: ignore
Message-Id: <20230607204415.88C6386D6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdeflate: force arm mode instead
 of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=62200879d49c085b120f37ce31d9123ebcc5895a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
