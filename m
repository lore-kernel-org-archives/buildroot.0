Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4726BEB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E09DE60B0D;
	Fri, 14 Jul 2023 10:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E09DE60B0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U2o-xT5OPLD4; Fri, 14 Jul 2023 10:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 042AC6141F;
	Fri, 14 Jul 2023 10:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 042AC6141F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 544DC1BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E0844179F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E0844179F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6iVQ5ESXc52 for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:31:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A459C4173B
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A459C4173B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A33687099; Fri, 14 Jul 2023 10:31:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 12:28:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e738ea3ebd6d1024b71f4f0ad5b8e63cccc0b37c
X-Git-Newrev: 7258c27f6335aa66ce634c93b82ab146bf65f7f2
X-Patchwork-Hint: ignore
Message-Id: <20230714103135.8A33687099@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: bump version to 0.189
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

commit: https://git.buildroot.net/buildroot/commit/?id=7258c27f6335aa66ce634c93b82ab146bf65f7f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch due to upstream commit
https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=c9c055a6949702af57e46f4eac3355d4a4f94c5d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch         | 4 ++--
 package/elfutils/elfutils.hash                                        | 4 ++--
 package/elfutils/elfutils.mk                                          | 2 +-
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
