Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98EECD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63E47416FF;
	Fri, 15 May 2026 09:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1Hz3L5gXMEg; Fri, 15 May 2026 09:09:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB850415B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778836196;
	bh=PCy6BV+ndhH5ezZCuKp0Zq0QA+QXm9hMZU/qhssysyI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JuJHThe/6rALPCuYjpKHj2u0KOrNCl1e1lIxMlpEN+nstVUQWDO7AO7m8XXeGJfBT
	 dnHHUOZcW8jlsoBa+1dOEEBweGhoKWDvmZV6F7f65zSD7w+S0H+Ew7Msva8Bwy6oOl
	 tp9B/wRKqxAo5ZSD55hGrMpvZ52pm139ZGcOKxXeYEfM2n/evexefqB5WCJg/q/WGl
	 YNRhaVjF20QTT/zkgZn+guBv7x7ZdBmRmP6NcEfCsPvZ/B81Omhad6uQuWMkfQbh5L
	 hDj1j3WzVi1lAFsrvRTBQmPnwgWvBIN36afarSU8rHfZPzn+1Q30Cm6bnKcom6BtL6
	 wljMVq+ujJ0sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB850415B9;
	Fri, 15 May 2026 09:09:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34CA936E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 266A9415B9
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8h6-KrOq1d9d for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4BB2415A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4BB2415A6
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2ABF186325; Fri, 15 May 2026 09:09:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 10:40:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 17aa65ebda86c8d6728582f83276a5c84995338b
X-Git-Newrev: e125a47fabaf87de1730dcc7ec0f1f0283b49801
X-Patchwork-Hint: ignore
Message-Id: <20260515090949.2ABF186325@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/elfutils: bump version
 to 0.195
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e125a47fabaf87de1730dcc7ec0f1f0283b49801
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://sourceware.org/pipermail/elfutils-devel/2026q2/009226.html

Rebased patch 0002 due to upstream commits:
https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=1fb2723c504588b60c3f796d91b535b50e0f4fd0
https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=45bf7360166b30465d5aebb7822f93c26f370b1b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch  | 10 +++++-----
 package/elfutils/elfutils.hash                                 |  4 ++--
 package/elfutils/elfutils.mk                                   |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch b/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
index f35c2d48aa..c3d2713840 100644
--- a/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
+++ b/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
@@ -12,12 +12,12 @@ function [-Werror=maybe-uninitialized]
 cc1: all warnings being treated as errors
 
 [Vincent: tweak patch for 0.166]
-[Bernd: rebased patch for 0.177 & 0.189]
 [Dario: make the patch to be applied with fuzz factor 0]
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased patch for 0.195]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  config/eu.am | 1 -
@@ -27,10 +27,10 @@ diff --git a/config/eu.am b/config/eu.am
 index e6c241f9d88a..cad1baa27a5f 100644
 --- a/config/eu.am
 +++ b/config/eu.am
-@@ -99,7 +99,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
- 	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+@@ -135,7 +135,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
  	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
- 	    $(USE_AFTER_FREE3_WARNING) \
+ 	    $(USE_AFTER_FREE3_WARNING) $(MISSING_PARAMETER_NAME_WARNING) \
+ 	    $(DEPRECATED_NON_PROTOTYPE_WARNING) $(FREE_LABELS_WARNING) \
 -	    $(if $($(*F)_no_Werror),,-Werror) \
  	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
  	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index 933420d1dd..f06196f0a1 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,5 @@
-# From https://sourceware.org/elfutils/ftp/0.194/sha512.sum
-sha512  5d00502f61b92643bf61dc61da4ddded36c423466388d992bcd388c5208761b8ed9db1a01492c085cd0984eef30c08f895a8e307e78e0df8df40b56ae35b78a5  elfutils-0.194.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.195/sha512.sum
+sha512  e1e1fdf4f7f72bf520deb0103bb8fd208dc247bab14af100c6fb56d38c0ef6c6d54ff5bd15b84e4f70e2b2ea481e5999fea2842360f8932a861122df79b5fc8f  elfutils-0.195.tar.bz2
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 176dc79f79..65ac15e64a 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.194
+ELFUTILS_VERSION = 0.195
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
