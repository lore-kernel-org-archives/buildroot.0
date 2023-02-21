Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06924C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 20:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6BEE405A4;
	Tue, 21 Feb 2023 20:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6BEE405A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4QfEjGN1c5s; Tue, 21 Feb 2023 20:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56B3E41030;
	Tue, 21 Feb 2023 20:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56B3E41030
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C37C1BF3F4
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 489D660A71
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 20:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 489D660A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wILh0J3lAItF for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 20:49:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B67960B33
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 20:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B67960B33
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BDB486671; Tue, 21 Feb 2023 20:49:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 21:47:16 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 11374681baa1b7eedc30c5bd04ad3b10c3488155
X-Git-Newrev: 02ea469db39bb3774093cbcf5c327873febeb0f6
X-Patchwork-Hint: ignore
Message-Id: <20230221204903.6BDB486671@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/xxhash: use
 MOREFLAGS instead of overriding CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=02ea469db39bb3774093cbcf5c327873febeb0f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Set MOREFLAGS instead of overriding CFLAGS to avoid the following build
failure raised since commit 94b66fb49cd57d0863245fbe0a3dc0833e76aad0:

/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /tmp/ccabb8cF.o: relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC

Fixes:
 - http://autobuild.buildroot.org/results/953133575d8c13266f1450fa545e70e4a518508d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bfef88762d19b2fd8f99b55cee5c9ebaf986e1c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xxhash/xxhash.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 40e3c2696c..75d375a2fa 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -28,8 +28,7 @@ endif
 
 define XXHASH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		CFLAGS="$(TARGET_CFLAGS) -DXXH_NO_INLINE_HINTS" \
-		$(XXHASH_TARGETS)
+		MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
 endef
 
 define XXHASH_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
