Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B7AC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 15:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADE6681D3A;
	Wed,  7 Feb 2024 15:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhzrmTH2zkwi; Wed,  7 Feb 2024 15:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDBE381D9F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDBE381D9F;
	Wed,  7 Feb 2024 15:40:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5ABC71BF471
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55928415BA
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 15:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qb7FYxkVDDD8 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 15:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9258441583
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9258441583
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 15:40:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C1A7875EB; Wed,  7 Feb 2024 15:40:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 16:40:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd56ac9eb63f0acecd78b1983f9d889f21f8fe0e
X-Git-Newrev: e2abe228230a017a7014d7aefd002ebb2c904442
X-Patchwork-Hint: ignore
Message-Id: <20240207154043.3C1A7875EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: drop -fpic workaround
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2abe228230a017a7014d7aefd002ebb2c904442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-fpic workaround is not needed since bump to version 0.166 in commit
794ae61a15f7a36e199b62b2e5224cfc41bdabea and
https://sourceware.org/git/?p=elfutils.git;a=commit;h=133509fa406e0e8d4d0f0632e2ee8c5e32dcb010
https://sourceware.org/git/?p=elfutils.git;a=commit;h=6a20e20ea9f122aea86533d28a688e7bb2812aa1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elfutils/elfutils.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 24eb168894..d43b545f2f 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -33,11 +33,6 @@ HOST_ELFUTILS_CONF_OPTS = \
 ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
 ELFUTILS_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
 
-# sparc64 needs -fPIC instead of -fpic
-ifeq ($(BR2_sparc64),y)
-ELFUTILS_CFLAGS += -fPIC
-endif
-
 ELFUTILS_CONF_ENV += \
 	CFLAGS="$(ELFUTILS_CFLAGS)" \
 	CPPFLAGS="$(ELFUTILS_CPPFLAGS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
