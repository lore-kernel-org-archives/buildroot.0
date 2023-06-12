Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BABEC7EE2F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 16:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1309883A7E;
	Mon, 12 Jun 2023 16:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1309883A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytqXKFeScAoZ; Mon, 12 Jun 2023 16:26:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 384E8838B6;
	Mon, 12 Jun 2023 16:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 384E8838B6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0810B1BF36D
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 16:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFA5541902
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 16:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFA5541902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2upzjOm4DXU for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 16:26:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DEC1418B6
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DEC1418B6
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 16:26:13 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout07.t-online.de (Postfix) with SMTP id 337CB2FB60
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 18:26:06 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.180.237]) by fwd87.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8kMk-0h0mIr0; Mon, 12 Jun 2023 18:26:02 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:43982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8kMk-0004VX-1E
 for buildroot@buildroot.org; Mon, 12 Jun 2023 18:26:02 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 18:26:02 +0200
Message-Id: <20230612162602.1528239-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686587162-4FFF6F7B-306EF56A/0/0 CLEAN NORMAL
X-TOI-MSGID: 4eecbd41-edf1-45eb-8286-a386f5a5c5db
Subject: [Buildroot] [PATCH 1/1] package/elfutils: bump version to 0.189
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rebased patch due to upstream commit
https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=c9c055a6949702af57e46f4eac3355d4a4f94c5d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch | 4 ++--
 package/elfutils/elfutils.hash                                | 4 ++--
 package/elfutils/elfutils.mk                                  | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch b/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
index 85ac1e4b64..565a3c1bbb 100644
--- a/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
+++ b/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
@@ -12,7 +12,7 @@ function [-Werror=maybe-uninitialized]
 cc1: all warnings being treated as errors
 
 [Vincent: tweak patch for 0.166]
-[Bernd: rebased patch for 0.177]
+[Bernd: rebased patch for 0.177 & 0.189]
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
@@ -26,9 +26,9 @@ index c2cc349ce876..99b368e09060 100644
 --- a/config/eu.am
 +++ b/config/eu.am
 @@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
- 	    -Wold-style-definition -Wstrict-prototypes -Wtrampolines \
  	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
  	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
+ 	    $(USE_AFTER_FREE3_WARNING) \
 -	    $(if $($(*F)_no_Werror),,-Werror) \
  	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
  	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index 3274b32650..e3cc67dc0e 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,5 @@
-# From https://sourceware.org/elfutils/ftp/0.186/sha512.sum
-sha512  c9180b27ec62935f18b9431268d176f6023d1bb938731d2af6e7626ae460af6608a70ba68483aa1ec7e6cb0fa0528b661ca8b68bc4f58ea8e18af527c5950c78  elfutils-0.186.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.189/sha512.sum
+sha512  93a877e34db93e5498581d0ab2d702b08c0d87e4cafd9cec9d6636dfa85a168095c305c11583a5b0fb79374dd93bc8d0e9ce6016e6c172764bcea12861605b71  elfutils-0.189.tar.bz2
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 8116ae5972..336544e125 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.186
+ELFUTILS_VERSION = 0.189
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
