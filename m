Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326D1CA101E
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 09:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0D5260765;
	Sun,  1 Sep 2024 09:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzzs5MxqDGm8; Sun,  1 Sep 2024 09:06:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0B2B606FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0B2B606FF;
	Sun,  1 Sep 2024 09:06:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D8BFC1BF4E2
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5B6D606FF
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aub9CRpZRpoi for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 09:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECE9F6069D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECE9F6069D
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 09:05:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9080868D0; Sun,  1 Sep 2024 09:05:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 10:46:00 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e8f185ec2caf258e4c0275a38a843180f9308a50
X-Git-Newrev: 51fa453efd639a3500f105f821482bf541d22f76
X-Patchwork-Hint: ignore
Message-Id: <20240901090559.E9080868D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/elfutils: update
 the patches to be applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=51fa453efd639a3500f105f821482bf541d22f76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit f5226cd6b72a7b47edbc3220b3e1279526c75b31)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch b/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
index 565a3c1bbb..f35c2d48aa 100644
--- a/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
+++ b/package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch
@@ -1,4 +1,4 @@
-From 2688a0238eaf825d6659c16c012db0c16f07e197 Mon Sep 17 00:00:00 2001
+From 064b74d5e19847794072781405eafe8dfbfca331 Mon Sep 17 00:00:00 2001
 From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Date: Mon, 29 May 2017 23:24:42 +0300
 Subject: [PATCH] Really make -Werror conditional to BUILD_WERROR
@@ -13,26 +13,28 @@ cc1: all warnings being treated as errors
 
 [Vincent: tweak patch for 0.166]
 [Bernd: rebased patch for 0.177 & 0.189]
+[Dario: make the patch to be applied with fuzz factor 0]
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  config/eu.am | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/config/eu.am b/config/eu.am
-index c2cc349ce876..99b368e09060 100644
+index e6c241f9d88a..cad1baa27a5f 100644
 --- a/config/eu.am
 +++ b/config/eu.am
-@@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
+@@ -99,7 +99,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
  	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
  	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
  	    $(USE_AFTER_FREE3_WARNING) \
 -	    $(if $($(*F)_no_Werror),,-Werror) \
  	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
  	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
- 	    $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
+ 	    $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
 -- 
-2.17.1
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
